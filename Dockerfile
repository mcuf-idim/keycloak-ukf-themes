FROM amazoncorretto:22-jdk AS builder
WORKDIR /build
COPY ./META-INF ./META-INF
COPY ./theme ./theme
RUN jar cf theme.jar ./theme ./META-INF

FROM alpine:latest AS release
WORKDIR /build
COPY --from=builder /build/theme.jar theme.jar
