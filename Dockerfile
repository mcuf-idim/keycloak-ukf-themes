FROM ubuntu:latest AS builder
WORKDIR /build
COPY ./META-INF ./META_INF
COPY ./theme ./theme
CMD jar cf theme.jar

FROM alpine:latest AS release
COPY --from=builder . ./build/theme.jar
