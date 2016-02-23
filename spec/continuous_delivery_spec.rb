require 'chefspec'
require_relative 'spec_helper'

describe 'devops-demo::continuous_delivery' do

  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'includes the gocd::server recipe' do
    expect(chef_run).to include_recipe('gocd::server')
  end

  it 'includes the gocd::agent recipe' do
    expect(chef_run).to include_recipe('gocd::agent')
  end

  it 'configures gocd delivery pipelines'

end