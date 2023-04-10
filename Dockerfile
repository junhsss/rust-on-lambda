FROM registry.gitlab.com/rust_musl_docker/image:stable-latest AS builder
WORKDIR /app
RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y ca-certificates
COPY . .
RUN cargo build --release --target x86_64-unknown-linux-musl

FROM scratch
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/rust-on-lambda /run
EXPOSE 8000
CMD ["./run"]
