# This class can be used install nomad components.
#
# @example when declaring the nomad class
#  class { '::profiles::scheduling::nomad': }
#
class profiles::scheduling::nomad (
  Hash $config = {
    'data_dir'   => '/opt/consul',
    'datacenter' => 'vagrant',
  },
  String $job_port_range = '20000-32000',
  String $version = '0.9.1',
){
  class {'nomad':
    config_hash => $config,
    version     => $version,
  }

  # https://www.nomadproject.io/docs/job-specification/network.html#dynamic-ports
  profiles::bootstrap::firewall::entry { '200 allow Nomad services':
    port => [$job_port_range],
  }

  profiles::bootstrap::firewall::entry { '200 allow Nomad http':
    port => [4646],
  }
  profiles::bootstrap::firewall::entry { '200 allow Nomad rpc':
    port => [4647],
  }
  profiles::bootstrap::firewall::entry { '200 allow Nomad serf':
    port => [4648],
  }
}