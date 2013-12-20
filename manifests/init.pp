class puppet_scripts {
	
	$puppetnowpath = $operatingsystem ? {
                centos  => "puppet:///modules/puppet_scripts/puppetnow-rhel",
                debian  => "puppet:///modules/puppet_scripts/puppetnow-deb",
                ubuntu  => "puppet:///modules/puppet_scripts/puppetnow-deb",
        }

	
        file { "puppet-ls.sh":
                path    => "/usr/bin/puppet-ls.sh",
                owner   => root,
                group   => root,
                mode    => 750,
                source => "puppet:///modules/puppet_scripts/puppet-ls.sh",
        }
	
	file { "puppet-pkg.sh":
 		path    => "/usr/bin/puppet-pkg",
                owner   => root,
                group   => root,
                mode    => 750,
                source => "puppet:///modules/puppet_scripts/puppet-pkg",

	}
	
	file { "puppetnow":
		path => "/usr/bin/puppetnow",
		owner   => root,
                group   => root,
                mode    => 750,	
		source => $puppetnowpath,
	}
}
