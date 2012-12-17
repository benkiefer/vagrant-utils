# ActiveMQ Manifest

class activemq($port="61616", $adminPort="8161") {	
	$instanceDirectory = "/etc/activemq/instances-enabled/main"
	
    # install the package
	package { "activemq":
		ensure => present,
	}

	# create a directory for your instance
	file { $instanceDirectory:
		ensure => directory,
		require => Package["activemq"],
	}

	# start the service after the package is installed
	service { "activemq":
		ensure => running,
		enable => true,
		subscribe => File["$instanceDirectory/activemq.xml"],
		require => Package["activemq"],
	}

	# drop the activemq config off after the jetty config
	file { "$instanceDirectory/activemq.xml":
		ensure => present,
		content => template("activemq/activemq.xml.erb"),
		require => File["$instanceDirectory"],

#		moving to this
#		require => File["$instanceDirectory/jetty.xml"],
	}

	# drop the jetty config off after the instance directory was created
#	file { "$instanceDirectory/jetty.xml":
#		ensure => present,
#		content => template("activemq/jetty.xml.erb"),
#		require => File["$instanceDirectory"],
#	}	
		
}