#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
USER_ID = 'PA6PBN8'.freeze
PAYLOAD = {
  notification_rule: {
    type: 'assignment_notification_rule',
    start_delay_in_minutes: 5,
    contact_method: {
      id: 'PJAZYCK',
      type: 'email_contact_method'
    },
    urgency: 'high'
  }
}.freeze

response = HTTParty.post(
  "https://api.pagerduty.com/users/#{USER_ID}/notification_rules",
  body: PAYLOAD.to_json,
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.body
