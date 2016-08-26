#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
SERVICE_ID = 'PY23E06'.freeze
INTEGRATION_ID = 'PFSKHOS'.freeze

response = HTTParty.get(
  "https://api.pagerduty.com/services/#{SERVICE_ID}/integrations/" \
  "#{INTEGRATION_ID}",
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.body
