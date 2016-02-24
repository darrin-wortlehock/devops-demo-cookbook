require 'chefspec'
require_relative 'spec_helper'

ChefSpec.define_matcher :gocd_agent

describe 'devops-demo::continuous_delivery' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  before do
    stub_command('/usr/local/go/bin/go version | grep "go1.6 "')
  end

  it 'includes the golang recipe' do
    expect(chef_run).to include_recipe('golang::default')
    expect(chef_run.node['go']['version']).to eq('1.6')
  end

  it 'includes the gocd::server recipe' do
    expect(chef_run).to include_recipe('gocd::server')
  end

  it 'writes a new cruise-config from template' do
    template = chef_run.template('/etc/go/cruise-config.xml')
    expect(template).to do_nothing
    expect(template)
      .to subscribe_to('template[/etc/default/go-server]')
      .on(:create).immediately
    expect(template)
      .to notify('service[go-server]')
      .to(:restart).delayed
  end

  it 'creates a gocd_agent when the go-server service has completed' do
    gocd_agent = chef_run.gocd_agent('go-agent')
    expect(gocd_agent).to do_nothing
    expect(gocd_agent)
      .to subscribe_to('service[go-server]')
      .on(:create).delayed
  end

  it 'includes the apt-docker recipe' do
    expect(chef_run).to include_recipe('apt-docker')
  end

  it 'installs the docker-engine package' do
    expect(chef_run).to install_package('docker-engine')
  end

  it 'adds the go user to the docker group' do
    expect(chef_run).to modify_group('docker').with(members: ['go'])
  end
end
