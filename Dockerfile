FROM golang:alpine as builder
WORKDIR /build
COPY go.mod .
COPY . .
RUN go build -o /main main.go

FROM alpine:3
COPY --from=builder main /bin/main
ENTRYPOINT ["/bin/main"]