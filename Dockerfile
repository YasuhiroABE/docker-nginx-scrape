
FROM golang:1.13 AS build-env

ENV GOPATH /root/go
RUN go get github.com/nginxinc/nginx-prometheus-exporter
WORKDIR /root/go/src/github.com/nginxinc/nginx-prometheus-exporter/
RUN go build

FROM ubuntu:18.04
MAINTAINER YasuhiroABE <yasu-abe@u-aizu.ac.jp>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ca-certificates

COPY --from=build-env /root/go/src/github.com/nginxinc/nginx-prometheus-exporter /work
WORKDIR /work

EXPOSE 9113

ENV NGINX_SCRAPE_URI="http://127.0.0.0:8080/stub_status"

COPY run.sh /run.sh
RUN chmod a+rx,a-w /run.sh

RUN useradd -m metric
USER metric
ENTRYPOINT ["/run.sh"]
