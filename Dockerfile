FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y build-essential curl gcc jq make && \
    apt-get purge --auto-remove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -LO https://github.com/polyml/polyml/archive/v5.8.tar.gz && \
    tar xf v5.8.tar.gz && \
    cd polyml-5.8 && ./configure --prefix=/usr && make && make install

COPY . /opt/test-runner
WORKDIR /opt/test-runner
ENTRYPOINT ["/opt/test-runner/bin/run.sh"]
