# ActiveMQ Manifest

class activemq($port="61616") {	
	
	package { "activemq":
		ensure => present,
	}

	file { "/etc/activemq/instances-enabled/main":
		ensure => directory,
		require => Package["activemq"],
	}

	file { "/etc/activemq/instances-enabled/main/activemq.xml":
		ensure => present,
		content => template("activemq/activemq.xml.erb"),
		require => File["/etc/activemq/instances-enabled/main"],
	}
	
	service { "activemq":
		ensure => running,
		enable => true,
		subscribe => File["/etc/activemq/instances-enabled/main/activemq.xml"],
		require => File["/etc/activemq/instances-enabled/main/activemq.xml"],
	}
		
}