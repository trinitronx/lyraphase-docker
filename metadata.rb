# frozen_string_literal: true

name 'lyraphase-docker'
maintainer 'James Cuzella'
maintainer_email 'james.cuzella@lyraphase.com'
license 'GPL-3.0'
description 'Installs/Configures docker-ce on a host'
version '0.1.0'
chef_version '>= 15.0' if respond_to?(:chef_version)

license 'GPL-3.0'

issues_url 'https://github.com/trinitronx/lyraphase-docker/issues'
source_url 'https://github.com/trinitronx/lyraphase-docker'

supports 'debian'

depends 'docker', '~> 6.0'
