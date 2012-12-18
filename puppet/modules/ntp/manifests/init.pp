class ntp (
	$version = "present",
	$ntpservers = ["1.pool.ntp.org", "2.pool.ntp.org"],
	$enable = true,
	$start = true
) {
	class{'ntp::install': } ->
	class{'ntp::config': } ~>
	class{'ntp::service': } ->
	Class["ntp"]
}

class ntp::install {
	package{'ntpd':
		ensure => $ntp::version
	}
}
 
class ntp::config {
	$ntpservers = $ntp::ntpservers
 
	File {
		owner   => root,
		group   => root,
		mode    => 644,
	}
 
	file{'/etc/ntp.conf':
         content => template('ntp/ntp.conf.erb');
	}
}
 
class ntp::service {
	$ensure = $ntp::start ? {true => running, default => stopped}
 
	service{"ntp":
		ensure  => $ensure,
		enable  => $ntp::enable,
	}
}