# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  #config.vm.box = "geerlingguy/ubuntu1604"
  config.vm.box = "bstoots/xubuntu-16.04-desktop-amd64"
  config.vm.hostname = "magento-devbox"
  config.vm.network "private_network", ip: "192.168.33.10"

  # Virtual box config
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "4048"
    vb.cpus = 2
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', "on"]
    vb.customize ["modifyvm", :id, "--name", "magento-devbox"]
  end

  # Ansible playbook
  # config.vm.synced_folder ".", "/vagrant", type: 'virtualbox'
  # Host -> Guest NFS
  #config.vm.synced_folder "./magento", "/home/vagrant/repos/magento",
  #type: 'nfs', mount_options: ['rw', 'async', 'fsc' ,'actimeo=2']
  #config.vm.synced_folder "magento/", "/home/vagrant/repos/magento"
  #, :owner => "life", :extra => 'dmode=775,fmode=774'

  config.vm.synced_folder "./src", "/var/www/magento",
        id: "site",
        mount_options: ['dmode=776', 'fmode=664'],
        owner: "vagrant",
        group: "vagrant"
        #owner: "www-data",
        #group: "www-data"

config.vm.synced_folder "./src", "/var/www/vagon.dev",
        id: "vagon",
        mount_options: ['dmode=776', 'fmode=664'],
        owner: "vagrant",
        group: "vagrant"
        #owner: "www-data",
        #group: "www-data"

  # Provisioning
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "ansible/playbook.yml"
    ansible.verbose = "v"
    ansible.extra_vars = "ansible/group_vars/dev.yml"
  end
end
