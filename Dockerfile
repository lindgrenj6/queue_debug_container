FROM ruby:2.6
MAINTAINER jlindgre@redhat.com

WORKDIR /app
COPY . /app

RUN apt update -qq && \
    apt install -qq -y librdkafka-dev && \
    apt clean all

RUN gem install bundler && bundle install

ENTRYPOINT ["bin/consume_messages.rb"]
