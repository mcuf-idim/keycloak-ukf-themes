FROM imbjava:latest AS builder
COPY ./META-INF ./META_INF
COPY ./theme ./theme
RUN jar cf theme.jar .

FROM alpine:latest AS release
COPY --from=builder theme.jar build/theme.jar
