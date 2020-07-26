# frozen_string_literal: true

#
# File:: Gemfile
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

# Gemfile
source 'https://rubygems.org'

# ruby '2.6.3'

group :test do
  gem 'rake'

  group :style do
    gem 'chef', '~> 16.2'
    gem 'cookstyle', '~> 6.9.0'
    gem 'foodcritic'
    gem 'rubocop', '>= 0.49.0'
  end
  group :unit do
    group :update_fauxhai do
      gem 'fauxhai-ng', '~> 8.2', github: 'customink/fauxhai'
    end
    gem 'chefspec', '~> 9.1'
  end

  group :integration do
    gem 'berkshelf', '~> 7.1'
    gem 'test-kitchen', '~> 2.5'
    group :docker do
      gem 'kitchen-docker', '~> 2.9'
      gem 'kitchen-dokken', '= 2.9.0'
    end
    # Use Aaron's Docker Ruby API patch to talk to docker running remotely
    # gem 'kitchen-docker', :github => 'adnichols/kitchen-docker', :branch => 'docker-ruby-api'
    # Not needed in Travis-CI
    gem 'kitchen-inspec', '~> 2.0.0'
    gem 'kitchen-vagrant'
  end
end

group :development do
  #  gem 'ruby_gntp'
  gem 'growl'
  gem 'guard', '~> 2.16'
  gem 'guard-foodcritic', '~> 3.0'
  gem 'guard-kitchen'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'rb-fsevent'
  #  gem 'mixlib-versioning'
  group :documentation do
    gem 'knife-cookbook-doc', '~> 0.29'
    gem 'github_changelog_generator', '~> 1.14'
  end
end
