FROM golang:1.9.2-alpine as builder
COPY qemu-*-static /usr/bin/
WORKDIR $GOPATH/src/github.com/zachlatta/sshtron
RUN apk add git --update --no-cache && \
git clone https://github.com/zachlatta/sshtron . && \
go install && \
CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /usr/bin/sshtron .
FROM alpine
COPY qemu-*-static /usr/bin/
LABEL maintainer="Jay MOULIN <https://twitter.com/MoulinJay>"
COPY --from=builder /usr/bin/sshtron /usr/bin/
RUN apk add --update --no-cache openssh-client && ssh-keygen -t rsa -N "" -f id_rsa
ENTRYPOINT sshtron
