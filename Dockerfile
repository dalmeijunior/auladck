FROM golang:1.24.1-alpine3.21 AS builder

WORKDIR /app

COPY . .

RUN  go build olamundo.go

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app .

CMD [ "./olamundo" ]