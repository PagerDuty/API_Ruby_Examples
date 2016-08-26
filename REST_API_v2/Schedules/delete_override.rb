#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
SCHEDULE_ID = 'PTC959G'.freeze
OVERRIDE_ID = 'Q2OUZU0QH6A236'.freeze

response = HTTParty.delete(
  "https://api.pagerduty.com/schedules/#{SCHEDULE_ID}/overrides/#{OVERRIDE_ID}",
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.code
