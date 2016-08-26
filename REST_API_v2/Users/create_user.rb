#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
REQUESTER_EMAIL = 'lucas@pagerduty.com'.freeze
PAYLOAD = {
  user: {
    type: 'user',
    name: 'Earline Greenholt',
    email: '125.greenholt.earline@graham.name',
    time_zone: 'America/Lima',
    color: 'green',
    role: 'admin',
    job_title: 'Director of Engineering',
    avatar_url: 'https://secure.gravatar.com/avatar/1d1a39d4635208d5664082a6c654a73f.png?d=mm&r=PG',
    description: 'I\'m the boss'
  }
}.freeze

response = HTTParty.post(
  'https://api.pagerduty.com/users',
  body: PAYLOAD.to_json,
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}",
    'From' => REQUESTER_EMAIL.to_str
  }
)

puts response.body
