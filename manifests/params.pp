
class zookeeper::params(
	$version = "3.4.5",
	$zookeeper_dir = "/opt/zookeeper",
	$zookeeper_data_dir = "/tmp/zookeeper",
	$zookeeper_port = "2181",
	$zookeeper_tickTime = 2000,
	$zookeeper_initLimit = 10,
	$zookeeper_syncLimit = 5,
	$zookeeper_archive = "/tmp/zookeeper.tar.gz",
	$zookeeper_id = "0",
	$ensemble_servers = [$fqdn],
	$user = undef,
	$group = undef,
)
{
}
