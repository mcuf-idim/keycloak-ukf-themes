FROM ubuntu:latest AS builder
COPY ./META-INF ./META_INF
COPY ./theme ./theme
RUN mkdir -p build
RUN xargs jar cf build/theme.jar

FROM alpine:latest AS release
COPY --from=builder build/theme.jar build/theme.jar
