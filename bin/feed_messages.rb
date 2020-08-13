#!/usr/bin/env ruby
# frozen_string_literal: true

require 'rdkafka'

config = {
  "bootstrap.servers": ENV['QUEUE_HOST'] || 'platform-mq-ci-kafka-bootstrap.platform-mq-ci.svc'
}

delivery_handles = []

producer = Rdkafka::Config.new(config).producer

300_000.times do |i|
  puts "producing message #{i}"
  delivery_handles << producer.produce(
    topic: 'platform.receptor-controller.responses',
    payload: " payload #{i}",
    key: "key #{i}"
  )
end
