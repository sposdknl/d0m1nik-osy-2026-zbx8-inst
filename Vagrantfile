IMAGE_NAME = "bento/debian-13"

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
    end

    config.vm.define "debian" do |debian|
        debian.vm.box = IMAGE_NAME
        debian.vm.network "forwarded_port", guest: 22, host: 2206, host_ip: "127.0.0.1"
        debian.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
        debian.vm.hostname = "d0m1nik-debian13"
    end
    config.vm.provision "shell", path: "install-zabbix-agent2.sh"

    
    config.vm.provision "shell", path: "install-zabbix-server.sh"

end
