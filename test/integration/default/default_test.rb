# InSpec test for recipe lyraphase-docker::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

# This is an example test, replace it with your own test.
describe file() do
  it { should exist }
  its('type') { should eq :socket }
  its('owner') { should eq 'root' }
  its('group') { should eq 'docker' }
end

describe systemd_service('docker') do
  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end

describe command('docker') do
  it { should exist }
  its('exit_status') { should eq 0 }
end