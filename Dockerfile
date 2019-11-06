
FROM ubuntu:18.04

MAINTAINER YasuhiroABE <yasu-abe@u-aizu.ac.jp>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	golang-go git ca-certificates make build-essential

ENV GOPATH /root/go
RUN go get github.com/nginxinc/nginx-prometheus-exporter
WORKDIR /root/go/src/github.com/nginxinc/nginx-prometheus-exporter/
RUN go build

EXPOSE 9113

ENV NGINX_SCRAPE_URI="http://127.0.0.0:8080/stub_status"

COPY run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
