FROM golang:1.18 AS builder

WORKDIR /app
COPY src .
RUN go build main.go

FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/main .

ENTRYPOINT [ "./main" ]