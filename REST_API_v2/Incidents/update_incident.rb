#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
REQUESTER_EMAIL = 'lucas@pagerduty.com'.freeze
INCIDENT_ID = 'PTVJTOQ'.freeze
PAYLOAD = {
  incident: {
    type: 'incident_reference',
    status: 'acknowledged'
  }
}.freeze

response = HTTParty.put(
  "https://api.pagerduty.com/incidents/#{INCIDENT_ID}",
  body: PAYLOAD.to_json,
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}",
    'From' => REQUESTER_EMAIL.to_str
  }
)

puts response.body
