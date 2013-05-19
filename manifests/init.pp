
class zookeeper
{
	require zookeeper::params

	file{$zookeeper::params::zookeeper_archive:
		source => "puppet:///modules/zookeeper/zookeeper-${zookeeper::params::version}.tar.gz"
	}

	file{$zookeeper::params::zookeeper_dir:
		ensure => "directory",
		owner => $zookeeper::params::user,
		group => $zookeeper::params::group,
	} ->

	file{$zookeeper::params::zookeeper_data_dir:
		ensure => "directory",
		owner => $zookeeper::params::user,
		group => $zookeeper::params::group,
	} ->

	exec{"tar xzf ${zookeeper::params::zookeeper_archive}":
		cwd => $zookeeper::params::zookeeper_dir,
		path => ["/bin", "/usr/bin"],
		user => $zookeeper::params::user,
		group => $zookeeper::params::group,
	} ->

	file{"${zookeeper::params::zookeeper_dir}/zookeeper-${zookeeper::params::version}/conf/zoo.cfg":
		content => template("zookeeper/conf/zoo.cfg.erb"),
		owner => $zookeeper::params::user,
		group => $zookeeper::params::group,
	} ->

	file{"${zookeeper::params::zookeeper_data_dir}/myid":
		content => $zookeeper::params::zookeeper_id,
		owner => $zookeeper::params::user,
		group => $zookeeper::params::group,
	}

}
