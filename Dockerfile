FROM golang as builder

WORKDIR /usr/src/app

COPY *.go /usr/src/app
RUN  go build -ldflags "-s -w" hello.go

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/hello /usr/src/app/hello

CMD [ "/usr/src/app/hello" ]