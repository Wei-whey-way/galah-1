FROM golang:latest
WORKDIR /galah
COPY . .
RUN apt update && apt install libpcap-dev -y
RUN <<EOF
go mod download
go build -o galah ./cmd/galah
EOF
ENTRYPOINT ["./galah"]