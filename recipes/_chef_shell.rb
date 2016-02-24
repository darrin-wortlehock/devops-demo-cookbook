#
# Cookbook Name:: devops-demo
# Recipe:: _base
#
# Copyright (C) 2015 Darrin Wortlehock
#
# All rights reserved - Do Not Redistribute
#

cookbook_file '/etc/profile.d/chef_shell.sh' do
  source 'chef_shell.sh'
  action :create
end
