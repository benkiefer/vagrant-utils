class apache {
  # install apache
  package { "apache2":
    ensure => present,
  }

  # create a service for apache after it is installed.
  service { "apache2":
    ensure => running,
    require => Package["apache2"],
  }
}