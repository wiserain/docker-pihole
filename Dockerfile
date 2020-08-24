ARG GOLANG_VER=1.15
ARG PIHOLE_VER=latest
FROM golang:${GOLANG_VER} AS builder

# AdguardTeam/dnsproxy
RUN go get -u github.com/AdguardTeam/dnsproxy

# folbricht/routedns
RUN go get -u github.com/folbricht/routedns/cmd/routedns

# cloudflare/cloudflared
RUN go get -u github.com/cloudflare/cloudflared/cmd/cloudflared

# DNSCrypt/dnscrypt-proxy
RUN go get -u github.com/DNSCrypt/dnscrypt-proxy/dnscrypt-proxy

# shawn1m/overture
RUN go get -u github.com/shawn1m/overture/main && \
    mv /go/bin/main /go/bin/overture

FROM pihole/pihole:${PIHOLE_VER}

ENV DNSPROXY_APP_BIN "routedns"
COPY --from=builder /go/bin/ /usr/bin/
COPY root/ /
