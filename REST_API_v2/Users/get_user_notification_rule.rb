#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
USER_ID = 'PA6PBN8'.freeze
NR_ID = 'P1JLJXA'.freeze

response = HTTParty.get(
  "https://api.pagerduty.com/users/#{USER_ID}/notification_rules/#{NR_ID}",
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.body
