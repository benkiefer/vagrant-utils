# Tomcat7 module

class tomcat7($port="8081",$redirectPort="9081") {
	$tomcatDir = "/var/lib/tomcat7"
	$webapps = "$tomcatDir/webapps"
	
	package { "tomcat7":
		ensure => present,
	}
	
	file { "/etc/tomcat7/server.xml":
		content => template("tomcat7/server.xml.erb"),
		require => Package["tomcat7"],
	}
	
	service { "tomcat7" :
		ensure => running,
		enable => true,
		subscribe => File["/etc/tomcat7/server.xml"],
		require => Package["tomcat7"],
	}

}