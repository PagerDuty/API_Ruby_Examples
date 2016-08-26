#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
SERVICE_ID = 'PY23E06'.freeze
PAYLOAD = {
  integration: {
    type: 'generic_events_api_inbound_integration',
    name: 'AWS Integration',
    service: {
      id: 'PY23E06',
      type: 'service'
    }
  }
}.freeze

response = HTTParty.post(
  "https://api.pagerduty.com/services/#{SERVICE_ID}/integrations",
  body: PAYLOAD.to_json,
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.body
