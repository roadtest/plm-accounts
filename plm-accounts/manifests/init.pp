# == Class: accounts
#
# Create PLM ops account on puppet client server
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Examples
#
#  class { accounts:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class plm-accounts {
    #exec {
    #"/bin/echo user1:abc123 | /usr/sbin/chpasswd":
    #onlyif => "/bin/egrep -q '^user1:\!:' /etc/shadow",
    #}

$ssh_user_hash = hiera(ssh_users)
  $user_keys = keys($ssh_user_hash)
  notice (" keys are $ssh_user_hash" )
  if is_array ($user_keys) {
    add_users { $user_keys: }
  }

  define add_users {
    $user_uid = $ssh_user_hash[$name][uid] 
    $real_name = $ssh_user_hash[$name][FullName]
    notice ( "$user_uid is $real_name ")
    plm-accounts::virtual { "$name" :
      uid => $user_uid,
      realname => $real_name,
        }
    plm-accounts::add_ssh_key { $name :
      key => "${ssh_user_hash[$name][ssh_key][key]}", 
      type => "${ssh_user_hash[$name][ssh_key][type]}"
                              }
  }
}
