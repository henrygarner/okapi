# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "lucid64"
  config.vm.box_url = "http://dl.dropbox.com/u/1537815/lucid64.box"

  config.vm.provision :shell, :inline => "apt-get update"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "chef"
    chef.add_recipe "okapi"
    chef.add_recipe "leiningen"
  end

  config.vm.forward_port 50030, 50030
  config.vm.forward_port 50060, 50060
  config.vm.forward_port 50070, 50070
  config.vm.forward_port 50075, 50075
  config.vm.forward_port 50090, 50090
  config.vm.forward_port 50105, 50105
end
