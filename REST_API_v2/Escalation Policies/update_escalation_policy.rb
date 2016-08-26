#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
EP_ID = 'PQHJE1L'.freeze
PAYLOAD = {
  escalation_policy: {
    type: 'escalation_policy',
    name: 'Engineering Escalation Policy'
  }
}.freeze

response = HTTParty.put(
  "https://api.pagerduty.com/escalation_policies/#{EP_ID}",
  body: PAYLOAD.to_json,
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.body
