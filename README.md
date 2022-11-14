I have created this enviroment with docker comtainers

ln -s  /opt/puppetlabs/bin/puppet /usr/local/sbin/puppet
ln -s /opt/puppetlabs/bin/puppetserver /usr/local/sbin/puppetserver

/etc/puppetlabs/puppet/autosign.conf

puppet cert list
puppetserver ca list --all

puppet cert sign agent.example.com
puppetserver ca sign --certname puppetubuntu.test.local

puppet config print

puppet resource --types | grep -i user

puppet describe user

puppet parser validate demouser.pp

puppet apply demouser.pp --noop

puppet agent -tv
