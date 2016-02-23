#
# Cookbook Name:: devops-demo
# Recipe:: default
#
# Copyright (C) 2016 Darrin Wortlehock
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'devops-demo::_base'
include_recipe 'devops-demo::web'
include_recipe 'devops-demo::app'
