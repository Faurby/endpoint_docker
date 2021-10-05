FROM golang:latest

RUN mkdir /build
WORKDIR /build
COPY . /build/

RUN apt-get update
RUN apt install -y protobuf-compiler

RUN GO111MODULE=on \
        go get google.golang.org/protobuf/cmd/protoc-gen-go@v1.25.0 \
        google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.1.0

RUN protoc --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative time/time.proto

EXPOSE 8080

ENTRYPOINT [ "" ]