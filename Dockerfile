FROM golang:latest

RUN mkdir /build
WORKDIR /build

RUN export G111MODULE=on
RUN go get github.com/Faurby/endpoint_docker/main
RUN cd /build && git clone https://github.com/Faurby/endpoint_docker.git

RUN cd /build/endpoint_docker/main && go build

#EXPOSE 8080

#ENTRYPOINT [ "/build/endpoint_docker/main/main"]