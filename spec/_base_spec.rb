require 'chefspec'
require_relative 'spec_helper'

describe 'devops-demo::_base' do

  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  it 'includes the ntp recipe' do
    expect(chef_run).to include_recipe('ntp')
  end

end