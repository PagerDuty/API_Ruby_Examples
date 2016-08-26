#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
PAYLOAD = {
  service: {
    type: 'service',
    name: 'My Web App',
    description: 'My cool web application that does things.',
    auto_resolve_timeout: 14_400,
    acknowledgement_timeout: 600,
    status: 'active',
    escalation_policy: {
      id: 'PIHA2XF',
      type: 'escalation_policy_reference'
    },
    incident_urgency_rule: {
      type: 'use_support_hours',
      during_support_hours: {
        type: 'constant',
        urgency: 'high'
      },
      outside_support_hours: {
        type: 'constant',
        urgency: 'low'
      }
    },
    support_hours: {
      type: 'fixed_time_per_day',
      time_zone: 'America/Lima',
      start_time: '09:00:00',
      end_time: '17:00:00',
      days_of_week: [
        1,
        2,
        3,
        4,
        5
      ]
    },
    scheduled_actions: [
      {
        type: 'urgency_change',
        at: {
          type: 'named_time',
          name: 'support_hours_start'
        },
        to_urgency: 'high'
      }
    ]
  }
}.freeze

response = HTTParty.post(
  'https://api.pagerduty.com/services',
  body: PAYLOAD.to_json,
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.body
