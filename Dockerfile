#1st build
FROM golang:1.10
WORKDIR /go/src/github.com/emailtovamos/m-highscore

COPY vendor ./vendor
COPY cli ./cli
COPY internal ./internal

RUN GOOS=linux go install ./cli/server

#2nd Stage

FROM alpine:latest
WORKDIR /app/

COPY --from=0 /go/bin/server ./binary

CMD ./binary