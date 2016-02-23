require 'chefspec'
require_relative 'spec_helper'

describe 'devops-demo::default' do
  let(:chef_run) { ChefSpec::ServerRunner.new.converge(described_recipe) }

  before do
    stub_command('which nginx').and_return(nil)
  end

  it 'includes the devops-demo::web recipe' do
    expect(chef_run).to include_recipe('devops-demo::web')
  end

  it 'includes the devops-demo::app recipe' do
    expect(chef_run).to include_recipe('devops-demo::app')
  end
end
