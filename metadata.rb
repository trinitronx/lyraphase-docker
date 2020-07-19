# frozen_string_literal: true

#
# Cookbook:: lyraphase-docker
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

name 'lyraphase-docker'
maintainer 'James Cuzella'
maintainer_email 'james.cuzella@lyraphase.com'
license 'GPL-3.0'
description 'Installs/Configures docker-ce on a host'
version '0.1.0'
chef_version '>= 15.0'

license 'GPL-3.0'

issues_url 'https://github.com/trinitronx/lyraphase-docker/issues'
source_url 'https://github.com/trinitronx/lyraphase-docker'

supports 'debian'

depends 'docker', '~> 6.0'

recipe 'lyraphase-docker::default', 'Install `docker-ce` from [Docker official Apt repository](https://docs.docker.com/engine/install/ubuntu/) via [`docker` cookbook.](https://supermarket.chef.io/cookbooks/docker)'
recipe 'lyraphase-docker::docker_compose', 'Install `docker-compose` via either [binary install method](https://github.com/docker/compose/releases/download), or from [official Ubuntu APT repository](http://archive.ubuntu.com/ubuntu/pool/universe/d/docker-compose/).'
