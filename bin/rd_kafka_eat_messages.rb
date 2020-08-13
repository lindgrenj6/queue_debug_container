#!/usr/bin/env ruby

# frozen_string_literal: true

require 'rdkafka'

config = {
  "bootstrap.servers": ENV['QUEUE_HOST'] || 'platform-mq-ci-kafka-bootstrap.platform-mq-ci.svc',
  "group.id": 'rdkafka-test2'
}

consumer = Rdkafka::Config.new(config).consumer
consumer.subscribe('platform.receptor-controller.responses')

consumer.each do |msg|
  puts "Message: #{msg}"
end
