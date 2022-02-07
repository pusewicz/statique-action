ARG RUBY_VERSION=3.1.0
ARG STATIQUE_VERSION=0.0.1

FROM ruby:$RUBY_VERSION-slim
ARG STATIQUE_VERSION

RUN apk add --no-cache --update --virtual .build-deps build-base libffi-dev && \
    gem install statique --version $STATIQUE_VERSION && rm -rf /root/.local/share/gem && rm -rf /usr/local/bundle/cache/*.gem && \
    apk del .build-deps

ENTRYPOINT ["/usr/local/bundle/bin/statique"]
