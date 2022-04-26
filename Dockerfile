FROM golang:1.16 as builder
WORKDIR /go/test/
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o main main.go

FROM scratch
WORKDIR /root
COPY --from=builder /go/test/main ./
CMD ["./main"]
