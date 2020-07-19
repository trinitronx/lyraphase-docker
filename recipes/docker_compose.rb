# frozen_string_literal: true

#
# Cookbook Name:: lyraphase-docker
# Recipe:: docker_compose

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
