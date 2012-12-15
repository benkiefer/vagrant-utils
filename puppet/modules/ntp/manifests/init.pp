# A module for syncing the time on the vm using ntp

class ntp {
	package { "ntp" :
		ensure => present,
	}
	
	file { "/etc/ntp.conf" :
		content => template("ntp/ntp.conf.erb"),
		require => Package["ntp"],
	}
	
	service { "ntp" :
		ensure => running,
		enable => true,
		subscripe => File["/etc/ntp.conf"],
		require => Package["ntp"],
	}
}