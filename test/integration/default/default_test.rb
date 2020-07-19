# frozen_string_literal: true

#
# Cookbook:: lyraphase-docker
# Recipe:: default
# Author:: James Cuzella
#
# Copyright:: 2020,  James Cuzella
# License:: GPLv3.0
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# InSpec test for recipe lyraphase-docker::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

describe file('/var/run/docker.sock') do
  it { should exist }
  its('type') { should eq :socket }
  its('owner') { should eq 'root' }
  its('group') { should eq 'docker' }
  its('mode') { should cmp '0660' }
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
