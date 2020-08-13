#!/usr/bin/env ruby

# frozen_string_literal: true

require 'manageiq-messaging'

messaging_client_opts = {
  protocol: :Kafka,
  host: ENV['QUEUE_HOST'] || 'platform-mq-ci-kafka-bootstrap.platform-mq-ci.svc',
  port: 9092,
  group_ref: 'platform.receptor-controller.responses',
  client_ref: 'platform.receptor-controller.responses'
}

client = ManageIQ::Messaging::Client.open(messaging_client_opts)

client.subscribe_topic(
  persist_ref: ENV['PERSIST_REF'] || 'jacobl',
  service: 'platform.receptor-controller.responses'
) do |msg|
  puts "#{msg.message},#{msg.payload}"
end
