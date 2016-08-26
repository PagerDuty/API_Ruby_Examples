#!/usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'httparty'

API_TOKEN = 'GFd723tgwEbnDcvixPV1'.freeze
USER_ID = 'PIMYWEZ'.freeze
PAYLOAD = {
  user: {
    type: 'user',
    name: 'Earline Greenholt',
    email: '125.greenholt.earline@graham.name',
    time_zone: 'America/Lima',
    color: 'green',
    role: 'limited_user',
    job_title: 'Engineering Intern',
    avatar_url: 'https://secure.gravatar.com/avatar/1d1a39d4635208d5664082a6c654a73f.png?d=mm&r=PG',
    description: 'I\'m the boss'
  }
}.freeze

response = HTTParty.put(
  "https://api.pagerduty.com/users/#{USER_ID}",
  body: PAYLOAD.to_json,
  headers: {
    'Content-Type' => 'application/json',
    'Accept' => 'application/vnd.pagerduty+json;version=2',
    'Authorization' => "Token token=#{API_TOKEN}"
  }
)

puts response.body
