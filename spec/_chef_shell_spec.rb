require 'chefspec'
require_relative 'spec_helper'

describe 'devops-demo::_chef_shell' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'copies chef_shell.sh to /etc/profile.d' do
    expect(chef_run).to render_file('/etc/profile.d/chef_shell.sh')
  end
end
