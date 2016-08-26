#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
ADDON_ID = 'P2QNCSQ'.freeze
PAYLOAD = {
  addon: {
    type: 'full_page_addon',
    name: 'PagerDuty Status Page',
    src: 'https://status.pagerduty.com/'
  }
}.freeze

response = HTTParty.put(
  "https://api.pagerduty.com/addons/#{ADDON_ID}",
  body: PAYLOAD.to_json,
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.body
