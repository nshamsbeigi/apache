class apache::config (
	String $configsource = lookup({"name" => "apache.configuresource", "default_value" => ""}),
	String $configfile = lookup({"name" => "apache.configfile", "default_value" => ""}),
	String $vhostsource = lookup({"name" => "apache.vhostsource", "default_value" => ""}),
	String $vhostfile = lookup({"name" => "apache.vhostfile", "default_value" => ""}),
	) {
	file { 'configfile':
		path	=> $configfile,
		ensure	=> file,
		source	=> $configsource,
	}

	file { 'vhost-file':
		path	=> $vhostfile
		ensure	=> file,
		content	=> template($vhostsource),
	}
}
		
