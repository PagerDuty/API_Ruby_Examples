#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
USER_ID = 'PA6PBN8'.freeze
CM_ID = 'PJAZYCK'.freeze
PAYLOAD = {
  contact_method: {
    type: 'email_contact_method',
    address: 'lucas+example@pagerduty.com'
  }
}.freeze

response = HTTParty.put(
  "https://api.pagerduty.com/users/#{USER_ID}/contact_methods/#{CM_ID}",
  body: PAYLOAD.to_json,
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.body
