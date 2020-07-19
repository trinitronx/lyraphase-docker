# frozen_string_literal: true

#
# Cookbook:: lyraphase-docker
# Recipe:: docker_compose
# Attribute:: docker_compose
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

#<> Whether to install binary via [GitHub Releases](https://github.com/docker/compose/releases/download) or the [Official Ubuntu APT repo packages](http://archive.ubuntu.com/ubuntu/pool/universe/d/docker-compose/). (`Boolean`). Available options: `true`, `false`
default['lyraphase-docker']['compose']['install_binary'] = false
#<> The version of `docker-compose` to install. Default is an empty String, and installs latest available APT package.
default['lyraphase-docker']['compose']['version'] = ''
