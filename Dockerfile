FROM amazoncorretto:22-jdk AS builder
WORKDIR /build
COPY ./META-INF ./META_INF
COPY ./theme ./theme
RUN jar cf theme.jar ./theme ./META_INF

FROM alpine:latest AS release
WORKDIR /build
COPY --from=builder theme.jar theme.jar
