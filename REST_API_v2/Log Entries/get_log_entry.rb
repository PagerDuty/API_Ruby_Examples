#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
LOG_ENTRY_ID = 'Q0AIJEFRX061DU'.freeze

response = HTTParty.get(
  "https://api.pagerduty.com/log_entries/#{LOG_ENTRY_ID}",
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.body
