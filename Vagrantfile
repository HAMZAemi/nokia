# -- mode: ruby --
# vi: set ft=ruby :
# -- mode: ruby --
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "frmthlft/centos-8-kernel-6-x86-minimal"
  config.vm.box_version = "1.0"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "redhat68"
    vb.memory = 4096
    vb.cpus = 4
  end

  config.vm.network "private_network", ip: "192.168.56.31"
  
  config.vm.synced_folder "/mnt/c/Users/ELKHADRI/lab/vagrant", "/vagrant", type: "rsync"
  
  
 #config.vm.provision "shell", path: "install_software.sh"
 # config.vm.provision "shell", path: "haproxy_setup.sh"
 # config.vm.provision "shell", path: "install_configure_dns.sh"
  config.vm.provision "shell", path: "setup-ntp-on-cent-os-8.sh"
end
