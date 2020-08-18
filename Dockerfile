ARG ALPINE_VER=3.12
ARG GOLANG_VER=1.14
FROM golang:${GOLANG_VER}-alpine${ALPINE_VER} AS builder

RUN apk add --no-cache curl bind-tools git
RUN go get -u github.com/folbricht/routedns/cmd/routedns

FROM alpine:${ALPINE_VER}

COPY --from=builder /go/bin/ /usr/bin/

ENTRYPOINT ["/usr/bin/routedns"]
