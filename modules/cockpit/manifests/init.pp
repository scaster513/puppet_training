class cockpit {
	if $::osfamily == 'RedHat' {
		package { 'cockpit' :
			ensure => installed,
		}
		service {'cockpit' :
			ensure => running,
			enable => true, 
			require => Package['cockpit'],
}
                file {'/etc/cockpit/cockpit.conf' :
			ensure => present,
			owner  => 'root',
			group => 'root',
			mode => '0644',
			source => 'puppet:///modules/cockpit/cockpit.conf',
			notify => Service['cockpit'],
		}
	} else {
		notify { 'This is not a supported distro': }
	}
}
