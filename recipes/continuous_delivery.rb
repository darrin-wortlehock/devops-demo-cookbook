#
# Cookbook Name:: devops-demo
# Recipe:: continuous_delivery
#
# Copyright (C) 2016 Darrin Wortlehock
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'devops-demo::_base'
include_recipe 'devops-demo::_chef_shell'

include_recipe 'apt-docker'
package 'docker-engine'

include_recipe 'golang::default'

include_recipe 'gocd::server'

template '/etc/go/cruise-config.xml' do
  source 'cruise-config.xml.erb'
  variables(
    uuid: SecureRandom.uuid,
    agent_autoregister_key: node['gocd']['agent']['autoregister']['key']
  )
  action :nothing
  subscribes :create, 'template[/etc/default/go-server]', :immediately
  notifies :restart, 'service[go-server]'
end

gocd_agent 'go-agent' do
  action :nothing
  subscribes :create, 'service[go-server]'
end

group 'docker' do
  action :modify
  members 'go'
  append true
end
