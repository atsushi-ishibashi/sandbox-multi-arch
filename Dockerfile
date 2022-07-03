FROM golang:1.18.3-alpine3.16 as builder
ENV APPDIR /go/src/github.com/atsushi-ishibashi/sandbox-multi-arch
RUN apk upgrade --no-cache
COPY main.go $APPDIR/
WORKDIR $APPDIR
RUN CGO_ENABLED=0 go build -ldflags "-s -w" -o sandbox-multi-arch ./main.go
RUN mv sandbox-multi-arch /

FROM gcr.io/distroless/static
COPY --from=builder /sandbox-multi-arch ./
ENTRYPOINT ["./sandbox-multi-arch"]
