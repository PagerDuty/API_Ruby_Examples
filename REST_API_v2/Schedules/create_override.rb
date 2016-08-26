#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
SCHEDULE_ID = 'PTC959G'.freeze
PAYLOAD = {
  override: {
    start: '2016-09-03T00:00:00-04:00',
    end: '2016-09-10T00:00:00-04:00',
    user: {
      id: 'PZSW8ZX',
      type: 'user_reference'
    }
  }
}.freeze

response = HTTParty.post(
  "https://api.pagerduty.com/schedules/#{SCHEDULE_ID}/overrides",
  body: PAYLOAD.to_json,
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.body
