# rubocop:disable Metrics/LineLength

default['go']['version'] = '1.6'
default['go']['gopath'] = '/opt/golang'
default['go']['gobin'] = "#{node['go']['gopath']}/bin"

default['gocd']['agent']['autoregister']['key'] = SecureRandom.hex
default['gocd']['agent']['user'] = { name: 'go', home: '/var/go' }
default['gocd']['agent']['chef']['server_url'] = Chef::Config[:chef_server_url]
default['gocd']['agent']['chef']['node_name'] = 'deploy'
default['gocd']['agent']['chef']['client_key'] = "#{node['gocd']['agent']['user']['home']}/.chef/#{node['gocd']['agent']['chef']['node_name']}.pem"

default['chef-client']['interval'] = 600
