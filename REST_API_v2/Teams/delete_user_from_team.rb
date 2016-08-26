#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
TEAM_ID = 'PWQ8081'.freeze
USER_ID = 'PY4H642'.freeze

response = HTTParty.delete(
  "https://api.pagerduty.com/teams/#{TEAM_ID}/users/#{USER_ID}",
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.code
