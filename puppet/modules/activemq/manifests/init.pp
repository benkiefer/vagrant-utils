# ActiveMQ Manifest

class activemq ( 
	$port="61616", 
	$adminPort="8161"
) {	
	class{'activemq::install': } ->
	class{'activemq::config': } ~>
	class{'activemq::service': } ->
	Class["activemq"]
}

class activemq::install {
	package { "activemq":
		ensure => present,
	}
}
	
class activemq::config { 
	$instanceDirectory = "/etc/activemq/instances-enabled/main"

	file {
		$instanceDirectory:
			ensure => directory;
		"$instanceDirectory/activemq.xml":
			ensure => present,
			content => template("activemq/activemq.xml.erb"),
			require => File["$instanceDirectory"];
#		"$instanceDirectory/jetty.xml":
#			ensure => present,
#			content => template("activemq/jetty.xml.erb"),
#			require => File["$instanceDirectory"];
	}
}

class activemq::service {
	service { "activemq":
		ensure => running,
		enable => true,
	}
}
