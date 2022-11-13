class ntpdemo{
  package { 'ntp':
    ensure => "present"
  }

  file { "/etc/ntp.conf":
    ensure  => "present",
    content => "server lk.pool.ntp.org iburst\n"
  }

  service { "ntpd":
    ensure  => "running"
  }
}

include ntpdemo
