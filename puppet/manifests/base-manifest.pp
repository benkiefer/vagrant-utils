# Standard configuration puppet file	

	# set constant file values
	File {
		owner   => root,
		group   => admin,
		mode    => 664,
	}

	# set up path correctly
	Exec { 
		path => '/usr/bin:/bin:/usr/sbin:/sbin', 
	}

	exec { 'apt-get-update':
		command => '/usr/bin/apt-get update',
	}

	# force all package executions to happen after the apt-get update
	Exec["apt-get-update"] -> Package <| |>
	
	class { "activemq":
		port => "61616",
		adminPort => "8161",
	}

#	timezone { "timezone":
#		zone => "CST6CDT",
#	}
	
#	class {"ntp":}