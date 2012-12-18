#set the timezone on your vm

define timezone( 
	$zone="CST6CDT"
) {	
	file { "/etc/localtime":
		ensure => link,
		target => "/usr/share/zoneinfo/$zone",
	}	
}