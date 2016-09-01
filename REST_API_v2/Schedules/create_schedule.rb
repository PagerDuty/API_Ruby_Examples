#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
PAYLOAD = {
  schedule: {
    name: 'Daily Engineering Rotation',
    type: 'schedule',
    time_zone: 'America/New_York',
    description: 'Rotation schedule for engineering',
    schedule_layers: [
      {
        name: 'Night Shift',
        start: '2017-11-06T20:00:00-05:00',
        end: '2017-11-06T20:00:00-05:00',
        rotation_virtual_start: '2017-11-06T20:00:00-05:00',
        rotation_turn_length_seconds: 86_400,
        users: [
          {
            id: 'P8ZGOI6',
            type: 'user'
          }
        ],
        restrictions: [
          {
            type: 'daily_restriction',
            start_time_of_day: '08:00:00',
            duration_seconds: 32_400
          }
        ]
      }
    ]
  }
}.freeze

response = HTTParty.post(
  'https://api.pagerduty.com/schedules',
  body: PAYLOAD.to_json,
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.body
