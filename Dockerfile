FROM golang:latest AS build-stage

RUN mkdir /build
WORKDIR /build
COPY . /build/

RUN apt-get update
RUN apt install -y protobuf-compiler

RUN GO111MODULE=on \
        go get google.golang.org/protobuf/cmd/protoc-gen-go@v1.25.0 \
        google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1.0

RUN protoc --go_out=. --go-grpc_out=. time/time.proto 

EXPOSE 8080