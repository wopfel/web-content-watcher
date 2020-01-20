# https://github.com/wopfel/web-content-watcher

FROM debian
MAINTAINER wopfel

RUN apt update && apt install -y \
    libyaml-tiny-perl \
    libwww-perl \
    jq \
    curl \
    procps \
  && rm -rf /var/lib/apt/lists/*

ADD run.sh /
ADD wcw /

RUN mkdir -p /data/{hooks,saved-content,websites}

VOLUME /data

CMD ["/run.sh"]

