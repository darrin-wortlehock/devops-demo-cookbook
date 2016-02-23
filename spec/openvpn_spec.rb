require 'chefspec'
require_relative 'spec_helper'

describe 'devops-demo::openvpn' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'includes the openvpn recipe' do
    expect(chef_run).to include_recipe('openvpn')
  end
end
