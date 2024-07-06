FROM ubuntu:latest AS builder
COPY . .
RUN mkdir -p build
RUN find . -not -path '*/\.*' -type f -not -path './build*' -not -path './hack*' | xargs jar cf build/theme.jar

FROM alpine:latest AS release
COPY --from=builder build/theme.jar build/theme.jar
