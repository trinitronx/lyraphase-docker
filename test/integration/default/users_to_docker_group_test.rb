# frozen_string_literal: true

#
# Cookbook:: lyraphase-docker
# Recipe:: default
# Author:: James Cuzella
#
# Copyright:: © 🄯 2020,  James Cuzella
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

# Ensure that a user is added to the Docker group

describe group('docker') do
  it { should exist }
end

describe user('vagrant') do
  it { should exist }
  its('groups') { should include 'docker' }
end
