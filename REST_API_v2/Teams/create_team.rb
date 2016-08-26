#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
PAYLOAD = {
  team: {
    type: 'team',
    name: 'Engineering',
    description: 'The engineering team'
  }
}.freeze

response = HTTParty.post(
  'https://api.pagerduty.com/teams',
  body: PAYLOAD.to_json,
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.body
