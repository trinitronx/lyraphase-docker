# frozen_string_literal: true

#
# Cookbook:: lyraphase-docker
# Recipe:: docker_compose
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

# InSpec test for recipe lyraphase-docker::docker_compose

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

install_binary = input('install_binary')
version = input('compose_version')
version_regexp = Regexp.new(version, Regexp::IGNORECASE | Regexp::MULTILINE)

describe command('docker-compose -v') do
  its('stdout') { should match(/docker-compose version/) }
  its('stdout') { should match(version_regexp) }
end

if install_binary
  describe command('dpkg -l docker-compose') do
    its('stderr') { should match(/no packages found matching docker-compose$/) }
  end
else
  describe command('dpkg -l docker-compose') do
    its('stdout') { should match(/^ii.*docker-compose.*$/) }
  end
end
