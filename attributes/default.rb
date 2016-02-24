
default['go']['version'] = '1.6'
default['go']['gopath'] = '/opt/golang'
default['go']['gobin'] = "#{node['go']['gopath']}/bin"
default['gocd']['agent']['autoregister']['key'] = SecureRandom.hex
