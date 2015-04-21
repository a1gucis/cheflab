chefmaster = "chefmaster"

## Used plugins:
#  * vagrant-hostmanager (1.5.0)

VIRTUAL_MACHINES = {
    :chefmaster => {
        :ip             => "192.168.105.101",              ## Private network
        :hostname       => "chefmaster",
        :memory         => "2048",
        :bootstrap      => "bootstrap_chefmaster.sh"
    },
    :chefwork       => {
        :ip             => "192.168.105.102",
        :hostname       => "chefwork",
        :memory         => "1024",
        :bootstrap      => "bootstrap_chefwork.sh"
    },
}

def assert_plugin(plugin_name)
  if !Vagrant.has_plugin?(plugin_name)
    puts plugin_name + " is missing. (vagrant plugin install " + plugin_name + ")"
    exit 1
  end
end

assert_plugin("vagrant-hostmanager")

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.hostmanager.enabled = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true  # boxes that are up or have a private ip configured will be added to the hosts file.

  VIRTUAL_MACHINES.each do |name, cfg|
    config.vm.define name do |vm_config|
      ## Configure basics.
      vm_config.vm.box                = cfg[:box]           if cfg[:box]
      vm_config.vm.box_url            = cfg[:box_url]       if cfg[:box_url]
      vm_config.vm.hostname           = cfg[:hostname]      if cfg[:hostname]
      vm_config.hostmanager.aliases   = cfg[:hostaliases]   if cfg[:hostaliases]
      vm_config.vm.network :private_network, ip: cfg[:ip]   if cfg[:ip]
      vm_config.vm.provision :shell, path: cfg[:bootstrap]  if cfg[:bootstrap]

      if cfg[:memory]
        vm_config.vm.provider "virtualbox" do |vb|
          vb.memory = cfg[:memory]
        end
      end

      if cfg[:forwards]
        cfg[:forwards].each do |guest, host|
          vm_config.vm.network :forwarded_port, guest: guest, host: host
        end
      end
    end
  end
end
