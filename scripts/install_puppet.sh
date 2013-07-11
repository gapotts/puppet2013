#!/bin/bash

FACTER_VERSION="1.6.18"
PUPPET_VERSION="3.2.2"

yum -y install wget ruby rubygems

groupadd -r -g 52 puppet
useradd -r -u 52 -g 52 -d /var/lib/puppet -s /sbin/nologin -c Puppet puppet

mkdir -p /var/tmp/tar
( cd /var/tmp/tar
  wget http://puppetlabs.com/downloads/facter/facter-${FACTER_VERSION}.tar.gz
  wget http://puppetlabs.com/downloads/puppet/puppet-${PUPPET_VERSION}.tar.gz
)

mkdir -p /var/tmp/src
( cd /var/tmp/src
  gunzip -c ../tar/facter-${FACTER_VERSION}.tar.gz | tar xvf -
  ( cd facter-${FACTER_VERSION} && ruby ./install.rb )
  gunzip -c ../tar/puppet-${PUPPET_VERSION}.tar.gz | tar xvf -
  ( cd puppet-${PUPPET_VERSION} && ruby ./install.rb )
)

gem install hiera
