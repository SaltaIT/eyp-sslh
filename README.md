# sslh

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What sslh affects](#what-sslh-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with sslh](#beginning-with-sslh)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)
    * [TODO](#todo)
    * [Contributing](#contributing)

## Overview

puppet module for [yrutschle/sslh](https://github.com/yrutschle/sslh), uses **sslh-fork**

## Module Description

If applicable, this section should have a brief description of the technology
the module integrates with and what that integration enables. This section
should answer the questions: "What does this module *do*?" and "Why would I use
it?"

If your module has a range of functionality (installation, configuration,
management, etc.) this is the time to mention it.

## Setup

### What sslh affects

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute on the system it's installed on.
* This is a great place to stick any warnings.
* Can be in list or paragraph form.

### Setup Requirements

This module requires pluginsync enabled

### Beginning with sslh

```puppet
class { 'sslh':
  listen_port => '444',
}

sslh::protocol { 'ssh':
  host => '127.0.0.1',
  port => '22',
}
```

```
[root@centos7 sslh]# curl -I https://10.0.2.15:444 --insecure
HTTP/1.1 301 Moved Permanently
Server: nginx
Date: Mon, 08 Jan 2018 17:26:18 GMT
Content-Type: text/html
Content-Length: 178
Connection: keep-alive
Location: http://systemadmin.es

[root@centos7 sslh]# ssh -p 444 vagrant@10.0.2.15
The authenticity of host '[10.0.2.15]:444 ([10.0.2.15]:444)' can't be established.
ECDSA key fingerprint is SHA256:2pWcmnQ4P38EUSSXNp89uG0um/K01bz/mWMJC3TMj2M.
ECDSA key fingerprint is MD5:24:23:14:32:58:14:91:76:55:91:20:87:e3:dc:30:c7.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '[10.0.2.15]:444' (ECDSA) to the list of known hosts.
vagrant@10.0.2.15's password:
Last login: Mon Jan  8 13:32:38 2018 from 10.0.2.2
Welcome to your Vagrant-built virtual machine.
[vagrant@centos7 ~]$ logout
Connection to 10.0.2.15 closed.
[root@centos7 sslh]# 
```

## Usage

Put the classes, types, and resources for customizing, configuring, and doing
the fancy stuff with your module here.

## Reference

Here, list the classes, types, providers, facts, etc contained in your module.
This section should include all of the under-the-hood workings of your module so
people know what the module is touching on their system but don't need to mess
with things. (We are working on automating this section!)

## Limitations

This is where you list OS compatibility, version compatibility, etc.

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature

### TODO

* create RPMs for it: https://github.com/repoforge/rpms/blob/master/specs/sslh/sslh.spec
* create PPA for debian based distros

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
