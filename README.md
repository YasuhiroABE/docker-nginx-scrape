# docker-nginx-scrape

The docker container invokes the self-build nginx-prometheus-exporter command.

## Motivation

The official nginxinc/nginx-prometheus-exporter container cannot handle the TLS target in our environment.

    $ sudo docker run -p 9113:9113 nginx/nginx-prometheus-exporter:0.4.2 -nginx.scrape-uri https://example.com/stub_status
    2019/11/07 01:32:00 Starting NGINX Prometheus Exporter Version=0.4.2 GitCommit=f017367
    2019/11/07 01:32:00 Could not create Nginx Client: failed to get https://example.com/stub_status: Get https://example.com/stub_status: x509: certificate signed by unknown authority

You can use the **-nginx.ssl-verify=false** option to ignore the certificate verification.
If you have not been interested in building the command by yourself, please consider using the official image instead.

# References

* https://github.com/nginxinc/nginx-prometheus-exporter
* https://qiita.com/minamijoyo/items/711704e85b45ff5d6405
	
# License

    Copyright 2019 Yasuhiro ABE <yasu-abe@u-aizu.ac.jp>

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
