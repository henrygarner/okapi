# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "lucid64"
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"

  config.vm.provision :shell, :inline => "apt-get update"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "chef"
    chef.add_recipe "hbase"
    chef.add_recipe "leiningen"
  end
end
