FROM golang:1.11.4-alpine3.8 AS envir

RUN apk --no-cache add git gcc musl-dev 

WORKDIR /github/lalkl4
RUN git clone https://github.com/lalkl4/go-ws-chat.git
WORKDIR /github/lalkl4/go-ws-chat
RUN go mod init
RUN go mod tidy
RUN go build -o /app .

FROM alpine:3.8
COPY --from=envir /app /app
ENTRYPOINT ["/app"]