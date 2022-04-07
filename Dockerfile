FROM golang as builder

WORKDIR /usr/src/app

COPY ./go/hello-world.go .

RUN go build hello-world.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/hello-world .

ENTRYPOINT  ["./hello-world"]
