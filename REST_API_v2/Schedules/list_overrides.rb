#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
SCHEDULE_ID = 'PTC959G'.freeze
PAYLOAD = {
  since: '2016-08-20',
  until: '2016-09-10'
}.freeze

response = HTTParty.get(
  "https://api.pagerduty.com/schedules/#{SCHEDULE_ID}/overrides",
  body: PAYLOAD.to_json,
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.body
