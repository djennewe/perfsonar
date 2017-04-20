#!/bin/bash
# init-puppet-agent.sh

echo 192.236.39.233 perfsonar-management.usd.edu puppet >>/etc/hosts

rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm

yum install -y puppet-agent

source /etc/profile

/opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

# sign the cert on puppet master with:
# puppet cert sign :all
# or 
# puppet cert sign perfsonar2.usd.edu
# Then:
#puppet agent -t
