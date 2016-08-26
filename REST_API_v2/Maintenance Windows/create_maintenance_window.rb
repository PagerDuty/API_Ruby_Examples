#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
REQUESTER_EMAIL = 'lucas@pagerduty.com'.freeze
PAYLOAD = {
  maintenance_window: {
    type: 'maintenance_window',
    start_time: '2016-12-20T20:00:00-05:00',
    end_time: '2016-12-20T22:00:00-05:00',
    description: 'Immanentizing the eschaton',
    services: [
      {
        id: 'PQ8QK9U',
        type: 'service_reference'
      }
    ]
  }
}.freeze

response = HTTParty.post(
  'https://api.pagerduty.com/maintenance_windows',
  body: PAYLOAD.to_json,
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}",
    'From' => REQUESTER_EMAIL.to_str
  }
)

puts response.body
