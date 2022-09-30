NUM_WORKER_NODES=1
IP_NW="10.0.0."
IP_START=10

Vagrant.configure("2") do |config|
    config.vm.provision "shell", inline: <<-SHELL
        apt-get update -y
        echo "$IP_NW$((IP_START))  master-node" >> /etc/hosts
        echo "$IP_NW$((IP_START+1))  worker-node01" >> /etc/hosts
        # echo "$IP_NW$((IP_START+2))  worker-node02" >> /etc/hosts
    SHELL
    config.vm.box = "ubuntu/focal64"
    config.vm.box_check_update = false
    config.disksize.size = '15GB'

    config.vm.define "master" do |master|
      master.vm.hostname = "master-node"
      master.vm.network "private_network", ip: IP_NW + "#{IP_START}"
      master.vm.provider "virtualbox" do |vb|
          vb.memory = 2024
          vb.cpus = 2
          vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      end
      
      master.vm.provision "shell", path: "scripts/common.sh"
      master.vm.provision "shell", path: "scripts/master.sh"

    #   master.vm.provision "ansible" do |ansible|
    #     ansible.playbook = "kubernetes-setup/master-playbook.yml"
    #     ansible.extra_vars = {
    #         node_ip: IP_NW + "#{IP_START}",
    #     }
    #   end
    end
    (1..NUM_WORKER_NODES).each do |i|
        config.vm.define "node-#{i}" do |node|
            node.vm.network "private_network", ip: IP_NW + "#{IP_START + i}"
            node.vm.hostname = "worker-node0#{i}"
            # node.vm.provision "ansible" do |ansible|
            #     ansible.playbook = "kubernetes-setup/node-playbook.yml"
            #     ansible.extra_vars = {
            #         node_ip: IP_NW + "#{IP_START + i}"
            #     }
            # end

            node.vm.provider "virtualbox" do |vb|
                vb.memory = 2048
                vb.cpus = 2
                vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            end
            node.vm.provision "shell", path: "scripts/common.sh"
            node.vm.provision "shell", path: "scripts/node.sh"
        end
    end
  end
   