# frozen_string_literal: true

#
# Cookbook:: test
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

%w(unit lint syntax).each do |phase|
  # TODO: This works on Linux/Unix. Not Windows.
  execute "HOME=/home/vagrant delivery job verify #{phase} --server localhost --ent test --org kitchen" do
    cwd '/tmp/repo-data'
    user 'vagrant'
    environment('GIT_DISCOVERY_ACROSS_FILESYSTEM' => '1')
  end
end
