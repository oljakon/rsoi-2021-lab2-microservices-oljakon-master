FROM golang:1.17 AS builder

ENV GO111MODULE=on

WORKDIR /app

COPY . .

RUN go mod tidy

RUN go build -o rental ./src/rental-service/cmd/rental-service

ENTRYPOINT ["./rental"]