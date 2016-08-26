#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
REQUESTER_EMAIL = 'lucas@pagerduty.com'.freeze
PAYLOAD = {
  escalation_policy: {
    type: 'escalation_policy',
    name: 'Engineering Escalation Policy',
    escalation_rules: [
      {
        escalation_delay_in_minutes: 30,
        targets: [
          {
            id: 'PEYSGVF',
            type: 'user_reference'
          }
        ]
      }
    ],
    repeat_enabled: true,
    services: [
      {
        id: 'PIJ90N7',
        type: 'service_reference'
      }
    ],
    num_loops: 2,
    teams: [
      {
        id: 'PQ9K7I8',
        type: 'team_reference'
      }
    ],
    description: 'Here is the ep for the engineering team.'
  }
}.freeze

response = HTTParty.post(
  'https://api.pagerduty.com/escalation_policies',
  body: PAYLOAD.to_json,
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}",
    'From' => REQUESTER_EMAIL.to_str
  }
)

puts response.body
