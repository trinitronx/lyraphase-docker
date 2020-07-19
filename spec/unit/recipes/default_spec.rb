# frozen_string_literal: true

#
# Cookbook:: lyraphase-docker
# Spec:: default
#
# Copyright:: 2020,  James Cuzella
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

require 'spec_helper'

describe 'lyraphase-docker::default' do
  context 'When all attributes are default, on Ubuntu 20.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '20.04'
    let(:docker_version) { '19.03.12' }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'installs docker' do
      expect { chef_run }.to create_docker_installation_package('default').with(version: docker_version)
    end
  end

  context 'When docker users set to brubble, on Ubuntu 20.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '20.04'
    let(:docker_version) { '19.03.12' }
    let(:docker_user) { 'brubble' }

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
    it 'installs docker' do
      expect { chef_run }.to expect(chef_run).to create_docker_installation_package('default').with(
        version: docker_version
      )
    end
    it 'adds brubble to docker group' do
      expect { chef_run }.to modify_group('docker').with_members('brubble')
    end
  end
end
