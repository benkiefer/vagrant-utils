# ActiveMQ Puppet Module

Includes a very simple puppet module that can be used to set up ActiveMQ in your vagrant instance. The current configuration is set up to work specifically with the precise64 ubuntu box, but may work with other Activemq packages as they are available.

## About the Module

Beyond the basic configuration for vagrant that is covered in my Vagrant Stuff README, you will also need to have port forwarding set up for port 61616, the default activemq port.

## To Do
 - Add examples to the README.
 - Expose some of the features used by the module as properties when you create the activemq class, allowing for more configurability.
 - Add support for the Web Console, potentially in either Jetty or Tomcat, most likely the latter.