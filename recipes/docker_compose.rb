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

compose_config = node['lyraphase-docker']['compose']

if compose_config['install_binary']
  local_binary = File.join('/usr/local/bin/docker-compose')
  github_downloads = 'https://github.com/docker/compose/releases/download'
  remote = compose_config['binary_location'] ||
    "#{github_downloads}/#{compose_config['version']}/docker-compose-Linux-x86_64"

  remote_file local_binary do
    source remote
    owner 'root'
    group 'root'
    mode '0755'
  end
else
  package 'docker-compose' do
    version compose_config['version'] if !compose_config['version'].nil? && !compose_config['version'].empty?
    action :install
  end
end
