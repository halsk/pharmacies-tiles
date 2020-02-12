FROM circleci/ruby:2.7.0
USER root
RUN apt-get update \
  && apt-get -y install sqlite3 git curl \
  && apt-get -y install build-essential libsqlite3-dev zlib1g-dev \
  && mkdir -p /usr/src \
  && cd /usr/src \
  && git clone https://github.com/mapbox/tippecanoe.git --depth 1 \
  && cd tippecanoe \
  && make \
  && make install \
  && make test \
  && cd / \
  && rm -fr /usr/src/tippecanoe \
  && apt-get -y purge \
    build-essential \
    libsqlite3-dev \
    zlib1g-dev \
  && apt-get -y autoremove \
  && rm -rf /var/lib/apt/lists/*
USER circleci