FROM ruby:2.6
MAINTAINER jlindgre@redhat.com

WORKDIR /app
COPY . /app

RUN gem install bundler && bundle install

ENTRYPOINT ["bin/consume_messages.rb"]
