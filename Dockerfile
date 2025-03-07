FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN  go build -ldflags "-s -w" olamundo.go

FROM scratch

WORKDIR /app

COPY --from=builder /app /app

CMD [ "./olamundo" ]