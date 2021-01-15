# frozen_string_literal: true

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/focal64'
  config.vm.network 'private_network', ip: '192.168.33.10'
  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'verification-cap-puma'
    vb.memory = 1024 * 4
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
  end

  config.vm.provision 'shell', inline: <<-SHELL
    apt-get update -qq; apt-get upgrade -y -qq
    apt-get install -y -qq git curl wget libsqlite3-dev
  SHELL

  config.vm.provision 'shell', inline: <<-SHELL
    apt-get install -y -qq nginx
    systemctl start nginx
    systemctl enable nginx
  SHELL

  config.vm.provision 'shell', inline: <<-SHELL
    apt-get install -y -qq \
      libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential \
      libgdbm-dev libgdbm-compat-dev libyaml-dev libncurses5-dev libffi-dev
    
    wget https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.2.tar.gz
    tar xvfz ruby-2.7.2.tar.gz
    cd ruby-2.7.2
    ./configure --disable-install-rdoc
    make -j 40
    make install
    gem install bundler
  SHELL

  config.vm.provision 'shell', inline: <<-SHELL
    mkdir -p /var/www/html
    chown vagrant:vagrant -R /var/www/html
  SHELL
end
