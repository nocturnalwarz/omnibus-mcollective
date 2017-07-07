# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box_check_update = true

  config.vm.define :omnibus do |omnibus|

    omnibus.vm.provider 'virtualbox' do |v|
      v.memory = 2048
      v.cpus = 2
    end

    omnibus.vm.box = 'puppetlabs/centos-7.2-64-nocm'
    omnibus.vm.host_name = 'omnibus.local'
    omnibus.vm.provision :shell do |shell|
      shell.path = 'scripts/omnibus.sh'
    end
  end
  
end
