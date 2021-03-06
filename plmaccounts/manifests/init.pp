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
class plmaccounts {
    #exec {
    #"/bin/echo user1:abc123 | /usr/sbin/chpasswd":
    #onlyif => "/bin/egrep -q '^user1:\!:' /etc/shadow",
    #}
  $ssh_user_hash = hiera('ssh_users')
  $user_keys = keys($ssh_user_hash)
  #  notify {" keys are $user_keys": }
  notice ( "user keys are $user_keys ")
  if is_array ($user_keys) {
    #@plm-accounts::virtual { $user_keys:; }
    plmaccounts::virtual { $user_keys:; }


    # user_keys has multiple value, can't use this way
    #  $name1 = $user_keys
    #notice ( "here is name of $title" )
    #    $user_uid = $ssh_user_hash[$name1]['uid'] 
    #$real_name = $ssh_user_hash[$name1]['FullName']
    #$user_uid = $ssh_user_hash[$name1]['uid'] 
    #$real_name = $ssh_user_hash[$name1]['FullName']
    # notice ( "$user_uid is $real_name ")
    #plm-accounts::virtual { "$name1" :
    #  uid => $user_uid,
    #  realname => $real_name,
    #    }
    #plm-accounts::add_ssh_key { "$name1"" :
    #    key => "${ssh_user_hash[$name1]['ssh_key']['key']}", 
    #    type => "${ssh_user_hash[$name1]['ssh_key']['type']}",
    #    }
  } else { notify { "should have more than one user": } }
}
