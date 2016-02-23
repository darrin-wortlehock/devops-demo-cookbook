#
# Cookbook Name:: devops-demo
# Recipe:: continuous_delivery
#
# Copyright (C) 2016 Darrin Wortlehock
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'devops-demo::_base'

include_recipe 'apt-docker'
package 'docker-engine'

include_recipe 'gocd::server'

template '/etc/go/cruise-config.xml' do
  source 'cruise-config.xml.erb'
  variables ({
      :uuid => SecureRandom::uuid
  })
  notifies :restart, 'service[go-server]'
end

group 'docker' do
  action :modify
  members 'go'
  append true
end
