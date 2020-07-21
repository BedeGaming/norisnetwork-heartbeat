# heartbeat::install
# @api private
#
# @summary It installs the heartbeat package
class heartbeat::install {
  case $heartbeat::ensure {
    'present': {
      $package_ensure = $heartbeat::package_ensure
    }
    default: {
      $package_ensure = $heartbeat::ensure
    }
  }

  case $::kernel {
    'windows': {
      package{ 'Beats heartbeat 7.8.0 (X86_64)':
        ensure => $heartbeat::ensure,
        source => "${heartbeat::package_source}/${heartbeat::package_name}",
      }
    }
    default: {
      package{ 'heartbeat-elastic':
        ensure => $package_ensure,
      }
    }
  }
}
