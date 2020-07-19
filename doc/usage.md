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
