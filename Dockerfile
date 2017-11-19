FROM ruby:2.4.1-alpine
LABEL maintainer "Jacky Alcine <jacky@goodforpocin.tech>"

ENV RACK_ENV=production \
    PORT=5000 \
    APP_DIR=/app \
    DATABASE_URL=""

RUN apk --update add --virtual build_deps \
    build-base ruby-dev libc-dev linux-headers \
    openssl-dev postgresql-dev libxml2-dev libxslt-dev

COPY ["Gemfile*", "$APP_DIR/"]
WORKDIR $APP_DIR

RUN gem install bundler --update && \
    bundle install --deployment --verbose

COPY . .

ENTRYPOINT ["./scripts/docker-entrypoint"]
CMD ["bin/puma", "-C", "config/puma.rb"]
