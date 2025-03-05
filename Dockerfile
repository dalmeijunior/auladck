FROM alpine:latest AS builder

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y golang-go && go mod init dada/go && go build -ldflags "-s -w" olamundo.go

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app .

CMD [ "./olamundo" ]