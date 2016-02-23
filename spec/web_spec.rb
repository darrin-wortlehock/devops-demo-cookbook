require 'chefspec'
require_relative 'spec_helper'

describe 'devops-demo::web' do

  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  before do
    stub_command("which nginx").and_return(nil)
  end

  it 'includes the devops-demo::_base recipe' do
    expect(chef_run).to include_recipe('devops-demo::_base')
  end
end