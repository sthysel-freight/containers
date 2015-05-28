# stolen from https://github.com/grahamc/docker-jekyll/blob/master/Dockerfile

FROM ruby:2.1
MAINTAINER sthysel <sthysel@gmail.com> 

ENV REFRESHED_AT 2015-03-07

RUN apt-get update && apt-get install -y --no-install-recommends \
      node \
      python-pygments \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

RUN gem install \
      github-pages \
      jekyll \
      jekyll-redirect-from \
      kramdown \
      rdiscount \
      rouge

VOLUME /src
EXPOSE 4000

WORKDIR /src
ENTRYPOINT ["jekyll"]
