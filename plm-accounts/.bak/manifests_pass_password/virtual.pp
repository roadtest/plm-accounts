# Defined type for creating virtual user accounts
#
define plm-accounts::virtual ($uid,$realname,$pass) {
user { $title:
ensure => 'present',
uid => $uid,
gid => $title,
shell => '/bin/bash',
home => "/home/${title}",
comment => $realname,
password => $pass,
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

}

define plm-accounts::add_ssh_key( $key, $type ) {
$username = $title
#ssh_authorized_key{ "${username}_${key}":
ssh_authorized_key{ "${username}":
ensure => present,
key => $key,
type => $type,
user => $username,
require => File["/home/$username/.ssh/authorized_keys"]
        }
}
