FROM golang:latest AS build

WORKDIR /go/src/

COPY hello.go hello.go

RUN go build hello.go

RUN echo "$PWD"

FROM scratch

COPY --from=build /go/src/hello hello

CMD ["/hello"]