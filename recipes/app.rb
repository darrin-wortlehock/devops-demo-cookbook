#
# Cookbook Name:: devops-demo
# Recipe:: app
#
# Copyright (C) 2016 Darrin Wortlehock
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'devops-demo::_base'

package 'devops-demo-app' do
  ignore_failure true
end