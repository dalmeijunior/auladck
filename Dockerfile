FROM ubuntu:latest AS builder

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y golang-go && go mod init dada/go && go build olamundo.go

FROM ubuntu:latest

WORKDIR /app

COPY --from=builder /app .

CMD [ "./olamundo" ]