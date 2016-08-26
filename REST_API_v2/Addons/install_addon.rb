#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
PAYLOAD = {
  addon: {
    type: 'full_page_addon',
    name: 'Internal Status Page',
    src: 'https://intranet.example.com/status'
  }
}.freeze

response = HTTParty.post(
  'https://api.pagerduty.com/addons',
  body: PAYLOAD.to_json,
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.body
