#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
TEAM_ID = 'PWQ8081'.freeze
EP_ID = 'PBRO2JB'.freeze

response = HTTParty.delete(
  "https://api.pagerduty.com/teams/#{TEAM_ID}/escalation_policies/#{EP_ID}",
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.code
