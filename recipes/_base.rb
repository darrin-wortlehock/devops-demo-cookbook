#
# Cookbook Name:: devops-demo
# Recipe:: _base
#
# Copyright (C) 2015 Darrin Wortlehock
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'ntp'
include_recipe 'chef-client::service'
