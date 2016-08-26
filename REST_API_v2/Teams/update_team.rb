#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
TEAM_ID = 'PTSS5XD'.freeze
PAYLOAD = {
  team: {
    type: 'team',
    name: 'Operations',
    description: 'The operations team'
  }
}.freeze

response = HTTParty.put(
  "https://api.pagerduty.com/teams/#{TEAM_ID}",
  body: PAYLOAD.to_json,
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.body
