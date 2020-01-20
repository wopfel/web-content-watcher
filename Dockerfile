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
ADD web-content-watcher/ /wcw/

VOLUME /wcw/hooks
VOLUME /wcw/saved-content
VOLUME /wcw/websites

CMD ["/run.sh"]

