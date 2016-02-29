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

directory '/var/go/.chef' do
  owner 'go'
  group 'go'
  mode '0755'
  action :create
end

template '/var/go/.chef/config.rb' do
  source 'chef-config.rb.erb'
  variables(
    chef_server_url: node['gocd']['agent']['chef']['server_url'],
    node_name: node['gocd']['agent']['chef']['node_name'],
    client_key: node['gocd']['agent']['chef']['client_key']
  )
end

directory '/var/go/.berkshelf' do
  owner 'go'
  group 'go'
  mode '0755'
  action :create
end

template '/var/go/.berkshelf/config.json' do
  source 'berks-config.json.erb'
end

secrets_bucket = data_bag_item('terraform', 'aws_s3_bucket.devops-demo-secrets')['bucket']
Chef::Log.warn("Using Secrets Bucket: #{secrets_bucket}")

log 'secrets_bucket' do
  message "Using Secrets Bucket: #{secrets_bucket}"
  level :warn
end

awscli_s3_file node['gocd']['agent']['chef']['client_key'] do
  bucket secrets_bucket
  key "#{node['gocd']['agent']['chef']['node_name']}.pem"
end

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
