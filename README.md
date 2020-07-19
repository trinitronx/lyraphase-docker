# lyraphase-docker
==================
[![Build Status](http://img.shields.io/travis/trinitronx/lyraphase-pi.svg)](https://travis-ci.org/trinitronx/lyraphase-pi)
[![GitHub Release](https://img.shields.io/github/release/trinitronx/lyraphase-pi.svg)](https://github.com/trinitronx/lyraphase-pi/releases)
[![Gittip](http://img.shields.io/gittip/trinitronx.svg)](https://www.gittip.com/trinitronx)

Installs `docker-ce` from Docker official Apt repository via `docker` cookbook.

Optionally: Installs `docker-compose` from either official Ubuntu Repositories

# Requirements

- [chef][1] gem (`>= 15.0`)
- [docker][2] cookbook (`~> 6.0.3`)

[1]: https://rubygems.org/gems/chef
[2]: https://supermarket.chef.io/cookbooks/docker