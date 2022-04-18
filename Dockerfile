FROM golang:latest as builder

WORKDIR /app

ENV GO111MODULE=on

ARG SERVICE
COPY ./src/$SERVICE ./src/$SERVICE
RUN go mod init rsoi2
RUN go mod tidy

WORKDIR ./src/$SERVICE
RUN go build -o main ./cmd/$SERVICE

 CMD ./main -docker