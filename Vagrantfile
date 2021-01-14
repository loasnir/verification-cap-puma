# frozen_string_literal: true

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/focal64'
  config.vm.network 'private_network', ip: '192.168.33.10'
  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'verification-cap-puma'
  end

  config.vm.provision 'shell', inline: <<-SHELL
    apt-get update
    apt-get install -y git curl build-essential libssl-dev ruby-build
  SHELL

  config.vm.provision 'shell', privileged: false, inline: <<-SHELL
    if ! [ -d ~/.rbenv ]; then
      git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
      git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
      echo 'export PATH="~/.rbenv/bin:$PATH"' >> ~/.bashrc
      echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    fi
  SHELL

  config.vm.provision 'shell', privileged: false, inline: <<-SHELL
    if ! [ -d ~/.rbenv/bin/rbenv ]; then
      export PATH="~/.rbenv/bin:$PATH"
      eval "$(rbenv init -)"
      rbenv install -s 2.7.2; rbenv rehash; rbenv global 2.7.2
      gem install bundler
    fi
  SHELL

  config.vm.provision 'shell', inline: <<-SHELL
    mkdir -p /var/www/html
    chown vagrant:vagrant -R /var/www/html
  SHELL
end
