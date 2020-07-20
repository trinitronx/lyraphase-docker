#!/usr/bin/env rake
# frozen_string_literal: true

#
# File:: Rakefile
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

require 'bundler/setup'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'knife_cookbook_doc/rake_task'
# http://acrmp.github.com/foodcritic/
require 'foodcritic'

task default: [:style, :spec]
task test: [:default]

# Maintainer tasks
namespace :maintainer do
  # With default options
  KnifeCookbookDoc::RakeTask.new(:doc)

  # Example with custom options
  KnifeCookbookDoc::RakeTask.new(:doc) do |t|
    t.options[:cookbook_dir] = './'
    t.options[:constraints] = true
    t.options[:output_file] = 'README.md'
    t.options[:template_file] = "#{File.dirname(__FILE__)}/doc/templates/README.md.erb"
  end
end

# Style tests. Knife, Rubocop and Foodcritic
namespace :style do
  ## Knife test is deprecated ... use CookStyle instead
  # http://wiki.opscode.com/display/chef/Managing+Cookbooks+With+Knife#ManagingCookbooksWithKnife-test
  # desc 'Test cookbooks via knife'
  # task :knife do
  #   cookbook_path = ENV['TRAVIS_BUILD_DIR'] ? ENV['TRAVIS_BUILD_DIR'] + '/../' : '.././'
  #   sh "knife cookbook test -c test/.chef/knife.rb -o #{cookbook_path} -a"
  # end

  require 'cookstyle'
  require 'rubocop/rake_task'
  desc 'Run CookStyle checks'
  RuboCop::RakeTask.new(:cook) do |task|
    task.options << '--display-cop-names'
  end

  desc 'Run RuboCop style checks'
  RuboCop::RakeTask.new(:ruby)

  desc 'Run FoodCritic style checks'
  FoodCritic::Rake::LintTask.new(:foodcritic) do |t|
    t.options = {fail_tags: ['correctness'], tags: ['~FC023', '~FC121'], context: true, exclude_paths: ['doc/**/*']}
  end
end

desc 'Run all style checks'
task style: ['style:foodcritic', 'style:ruby', 'style:cook']

# http://berkshelf.com/
desc 'Install Berkshelf to local cookbooks path'
task :berks do
  sh %(berks vendor cookbooks)
end

# https://github.com/acrmp/chefspec
# Rspec and ChefSpec
desc 'Run ChefSpec Unit Tests'
RSpec::Core::RakeTask.new(:spec)
# Alias for rake spec
task chefspec: [:spec]

# Integration tests. Kitchen.ci
namespace :integration do
  desc 'Run Test Kitchen integration tests with Vagrant'
  # Gets a collection of instances.
  #
  # @param regexp [String] regular expression to match against instance names.
  # @param config [Hash] configuration values for the `Kitchen::Config` class.
  # @return [Collection<Instance>] all instances.
  def kitchen_instances(regexp, config)
    instances = Kitchen::Config.new(config).instances
    return instances if regexp.nil? || regexp == 'all'

    instances.get_all(Regexp.new(regexp))
  end

  # Runs a test kitchen action against some instances.
  #
  # @param action [String] kitchen action to run (defaults to `'test'`).
  # @param regexp [String] regular expression to match against instance names.
  # @param loader_config [Hash] loader configuration options.
  # @return void
  def run_kitchen(action, regexp, loader_config={})
    action = 'test' if action.nil?
    require 'kitchen'
    Kitchen.logger = Kitchen.default_file_logger
    config = {loader: Kitchen::Loader::YAML.new(loader_config)}
    kitchen_instances(regexp, config).each { |i| i.send(action) }
  end

  desc 'Run integration tests with kitchen-vagrant'
  task :vagrant, [:regexp, :action] do |_t, args|
    run_kitchen(args.action, args.regexp)
  end

  desc 'Run integration tests with kitchen-docker'
  task :docker, [:regexp, :action] do |_t, args|
    run_kitchen(args.action, args.regexp, local_config: '.kitchen.docker.local.yml')
  end
end

desc 'Run all unit tests on Travis'
task travis: ['style', 'spec']
