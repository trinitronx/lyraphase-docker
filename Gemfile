# frozen_string_literal: true

# Gemfile
source 'https://rubygems.org'

ruby '2.6.3'

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
end
