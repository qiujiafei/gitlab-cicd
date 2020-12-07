# -*- mode: ruby -*-
# vi: set ft=ruby :
boxes = [
  {
    :name => "gitlab",
    :eth1 => "192.168.33.10",
    :mem => "4096",
    :cpu => "2",
    :folder => "./gitlab",
    :shell => "./gitlab/bootstrap.sh"
  },
  {
    :name => "gitlab_dns",
    :eth1 => "192.168.33.13",
    :mem => "1024",
    :cpu => "1",
    :folder => "./gitlab_dns",
    :shell => "./gitlab_dns/bootstrap.sh"
  },
  {
    :name => "gitlab_ci",
    :eth1 => "192.168.33.11",
    :mem => "2048",
    :cpu => "2",
    :folder => "./gitlab_ci",
    :shell => "./gitlab_ci/bootstrap.sh"
  },
  {
    :name => "gitlab_cd",
    :eth1 => "192.168.33.12",
    :mem => "2048",
    :cpu => "2",
    :folder => "./gitlab_ci",
    :shell => "./gitlab_ci/bootstrap.sh"
  },
]

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  boxes.each do |opts|
      config.vm.define opts[:name] do |config|
        config.vm.provider "virtualbox" do |v|
          v.customize ["modifyvm", :id, "--memory", opts[:mem]]
          v.customize ["modifyvm", :id, "--cpus", opts[:cpu]]
        end

        config.vm.network :private_network, ip: opts[:eth1]
        config.vm.synced_folder opts[:folder], "/mnt", type: "nfs"
        config.vm.provision "shell", path: opts[:shell]
      end
  end
end
