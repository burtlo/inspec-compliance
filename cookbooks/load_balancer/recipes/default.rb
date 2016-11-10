#
# Cookbook Name:: load_balancer
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

directory '/profiles/myaudit' do
  recursive true
end

cookbook_file '/profiles/myaudit/first.rb' do
  source 'first.rb'
end

cookbook_file '/profiles/broken_arrow.tar.gz' do
  source 'broken_arrow.tar.gz'
end

file 'first.txt' do
  content 'Hello World'
end

node.default['audit'] = {
  "collector" => "json-file",
  "owner": "my-comp-org",
  "interval" => { "enabled" => false, "time" => "0" },
  "profiles" => [
    {
      "name": "myaudit",
      # filesystem path
      "path": "/profiles/myaudit"
    },
    {
      "name": "broken_arrow",
      # filesystem path
      "path": "/profiles/broken_arrow.tar.gz"
    }
  ]
}
