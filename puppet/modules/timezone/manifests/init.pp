#set the timezone on your vm

class timezone($zone="CST6CDT"){	
	
	# replace existing time zone config
	file { "/etc/localtime":
		ensure => link,
		target => "/usr/share/zoneinfo/$zone",
		force => true,
	}	

}