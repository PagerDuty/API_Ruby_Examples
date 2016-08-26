#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
MW_ID = 'P3DTUH5'.freeze

response = HTTParty.delete(
  "https://api.pagerduty.com/maintenance_windows/#{MW_ID}",
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.code
