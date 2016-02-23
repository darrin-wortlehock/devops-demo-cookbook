require 'chefspec'
require_relative 'spec_helper'

describe 'devops-demo::app' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'includes the devops-demo::_base recipe' do
    expect(chef_run).to include_recipe('devops-demo::_base')
  end

  it 'installs the latest devops-demo package' do
    expect(chef_run).to install_package('devops-demo-app')
  end
end
