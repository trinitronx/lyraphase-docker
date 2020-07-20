# frozen_string_literal: true

#
# Cookbook:: lyraphase-docker
# Recipe:: default
# Attribute:: default
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

# <
# A list of pre-existing users to add to the '`docker`' group. Optional.
# The default is an empty Array (`[]` ), which skips this task, and adds no users to `docker` group.
# >
default['lyraphase-docker']['users'] = []
# <> The version of `docker-ce` APT package to install. Supports same syntax as APT (e.g.: `version: 1.2.3` => `apt-get install docker-ce=1.2.3`, with version placed after `=`)
default['lyraphase-docker']['version'] = '19.03.12'
