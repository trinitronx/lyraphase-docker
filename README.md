# lyraphase-docker
==================

[![Build Status](http://img.shields.io/travis/trinitronx/lyraphase-pi.svg)](https://travis-ci.org/trinitronx/lyraphase-pi)
[![GitHub Release](https://img.shields.io/github/release/trinitronx/lyraphase-pi.svg)](https://github.com/trinitronx/lyraphase-pi/releases)
[![Gittip](http://img.shields.io/gittip/trinitronx.svg)](https://www.gittip.com/trinitronx)

# Description

Installs `docker-ce` from Docker official Apt repository via `docker` cookbook.

Optionally: Installs `docker-compose` from either official Ubuntu Repositories or from binary GitHub Releases page.

# Requirements


- [chef][1] gem (`>= 15.0`)
- [docker][2] cookbook (`~> 6.0.3`)


[1]: https://rubygems.org/gems/chef
[2]: https://supermarket.chef.io/cookbooks/docker

## Chef Client:

* chef (>= 15.0) ()

## Platform:

* debian

## Cookbooks:

* [docker](https://github.com/chef-cookbooks/docker) (~> 6.0)

# Usage

1. Bootstrap Chef Infra Client on a node.
  - For example: `/usr/local/bin/knife bootstrap  --connection-user ubuntu --ssh-identity-file ~/.ssh/id_rsa --sudo  --ssh-verify-host-key accept_new --host example.local`
2. Create a role for your Docker host, and include the recipes for it.

For example, to install:

- Docker Community Edition version `19.03.12` from official Docker apt repository
- Docker Compose binary version `1.26.2` from GitHub releases

```ruby
name "docker-host"
description "Role for docker hosts"
default_attributes 'lyraphase-docker' => {
    'version' => '19.03.12',
    'users' => [ 'ubuntu' ],
    'compose' => {
      'install_binary' => true,
      'version' => '1.26.2'
    }
  }
run_list [ "lyraphase-docker::default", "lyraphase-docker::docker_compose" ]
```


# Attributes

* `node['lyraphase-docker']['users']` - A list of pre-existing users to add to the '`docker`' group. Optional.
The default is an empty Array (`[]` ), which skips this task, and adds no users to `docker` group. Defaults to `[ ... ]`.
* `node['lyraphase-docker']['version']` - The version of `docker-ce` APT package to install. Supports same syntax as APT (e.g.: `version: 1.2.3` => `apt-get install docker-ce=1.2.3`, with version placed after `=`). Defaults to `19.03.12`.
* `node['lyraphase-docker']['compose']['install_binary']` - Whether to install binary via [GitHub Releases](https://github.com/docker/compose/releases/download) or the [Official Ubuntu APT repo packages](http://archive.ubuntu.com/ubuntu/pool/universe/d/docker-compose/). (`Boolean`). Available options: `true`, `false`. Defaults to `false`.
* `node['lyraphase-docker']['compose']['version']` - The version of `docker-compose` to install. Default is an empty String, and installs latest available APT package. Defaults to ``.

# Recipes

* lyraphase-docker::default - Install `docker-ce` from [Docker official Apt repository](https://docs.docker.com/engine/install/ubuntu/) via [`docker` cookbook.](https://supermarket.chef.io/cookbooks/docker)
* lyraphase-docker::docker_compose - Install `docker-compose` via either [binary install method](https://github.com/docker/compose/releases/download), or from [official Ubuntu APT repository](http://archive.ubuntu.com/ubuntu/pool/universe/d/docker-compose/).

# License and Maintainer

Maintainer:: James Cuzella ([@trinitronx][keybase-id])

Source:: https://github.com/trinitronx/lyraphase-docker

Issues:: https://github.com/trinitronx/lyraphase-docker/issues

License:: GPL-3.0

[keybase-id]: https://gist.github.com/trinitronx/aee110cbdf55e67185dc44272784e694
