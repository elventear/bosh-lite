Vagrant.configure('2') do |config|
  config.vm.box = 'elventear/bosh-lite'

  config.vm.provider :virtualbox do |v, override|
    override.vm.box_version = '0.0.1' # ci:replace
    # To use a different IP address for the bosh-lite director, uncomment this line:
    # override.vm.network :private_network, ip: '192.168.59.4', id: :local
  end

  [:vmware_fusion, :vmware_desktop, :vmware_workstation].each do |provider|
    config.vm.provider provider do |v, override|
      override.vm.box_version = '388'
      # To use a different IP address for the bosh-lite director, uncomment this line:
      # override.vm.network :private_network, ip: '192.168.54.4', id: :local
    end
  end

  config.vm.provider :aws do |v, override|
    override.vm.box_version = '0.0.1' # ci:replace
    # To turn off public IP echoing, uncomment this line:
    # override.vm.provision :shell, id: "public_ip", run: "always", inline: "/bin/true"

    # To turn off CF port forwarding, uncomment this line:
    # override.vm.provision :shell, id: "port_forwarding", run: "always", inline: "/bin/true"
  end

  if !ENV['AF_TENANT_ID'].nil?
    config.vm.provision "appfirst", type: "shell" do |s|
      s.path = 'appfirst/gen_conf.sh'
      s.args = [ ENV['AF_TENANT_ID'] ]
      
      if !ENV['AF_FRONT_URL'].nil?
        s.args << ENV['AF_FRONT_URL']
      end
    end
  end
end
