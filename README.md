# Vagrant Stuff
Resources:
 - Pro Puppet
 - puppetcookbook.com
 - vagrantup.com
 - packages.ubuntu.com

In order to use this stuff you must have:
 - Vagrant installed
 - Virtual Box installed
 - This project checked out
 - At least 512MB of RAM available
 - The precise64 box installed ("vagrant box add precise64 http://files.vagrantup.com/precise64.box")

To start up the VM, cd to the checkout directory and type 'vagrant up'. For practical purposes, you will need to know more commands than this, but at least this will get your vm up.

You can can connect to the VM through Cygwin with command "ssh vagrant@localhost -p2222". When prompted for the password, type "vagrant".
 
# Current Modules 
 - VIM
 - Apache
 - Activemq

Note: Activemq is the only module that is installed by default currently.
 
# Coming Soon
Modules for MySql and H2. I hope.