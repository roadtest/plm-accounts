# Defined type for creating virtual user accounts
#
define plmaccounts::virtual {
  #notice ("NAME is $name and $username")
  #$users = ${plm-accounts::ssh_user_hash[$username]}
  $uid = $plmaccounts::ssh_user_hash[$name][uid]
  #$uid = $users['uid']
  $realname = $plmaccounts::ssh_user_hash[$name]['FullName']
  $key = $plmaccounts::ssh_user_hash[$name][ssh_key][key]
  $type = $plmaccounts::ssh_user_hash[$name][ssh_key][type]
  notice ( "$title is $realname with uid - $uid and keytype is $type" )

user { $title:
ensure => 'present',
uid => $uid,
gid => $title,
shell => '/bin/bash',
home => "/home/${title}",
comment => $realname,
managehome => true,
require => Group[$title],
  }

group { $title:
gid => $uid,
  }

file { "/home/${title}":
ensure => directory,
owner => $title,
group => $title,
mode => 0750,
require => [ User[$title], Group[$title] ],
  }

file { "/home/${title}/.ssh":
ensure => directory,
owner => $title,
group => $title,
mode => 700,
require => File["/home/${title}/"]
  }


file { "/home/${title}/.ssh/authorized_keys":
ensure => present,
owner => $title,
group => $title,
mode => 600,
require => File["/home/${title}/.ssh"]
  }

  #exec {
  #  "/bin/echo user1:abc123 | /usr/sbin/chpasswd":
  #  onlyif => "/bin/egrep -q '^user1:\!:' /etc/shadow",
  #}


#define plmaccounts::add_ssh_key( $key, $type ) 
# ssh_authorized_key "${username}_${key}":
ssh_authorized_key{ "$name":
ensure => present,
key => $key,
type => $type,
user => $name,
require => File["/home/$name/.ssh/authorized_keys"]
        }
}
