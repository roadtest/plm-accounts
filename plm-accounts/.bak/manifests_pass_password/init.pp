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
  @plm-accounts::virtual { 'user1':
    uid      => 1005,
    realname => 'Testing User1',
    pass     => '$6$jNVwBfNV$S4JPdRZeEhv9vVGFfaafuW1AR7oKlfB8IPyHJlfOmSKvI2edNyzimpS/s./JF4xTg1hHX7.SXk6z/9NDs3DIc1'
    }

  @plm-accounts::add_ssh_key { user1:
    key     =>  "AAAAB3NzaC1yc2EAAAABIwAAAQEAwtnN3Nmkn8WKfBUs4/AwCmthfsY6TXmEe63d2Okeo3QtpUvceXj83bVqerK6h62bEGb7LtE2oW8utiE8ZlWmeViMdIZo6OQVOMj69HgPZu3IKSIYW5hTVWhb5FmQOOtGk5m1uxJyeBI5ivmVJtQIrH6gOkoOP1X23PqLCUnb1Wur9J6NCAOOLtJQEl+CMTSRqNZ6VU/4Kvu0FxSiAqHdi5i4zpob3HIWXSC0Ugh664jqvjjJI7ZLuC4Ym3BFK+uZKVX3yKIx0sbiZm+IMBvuUJzmpfPTMPrMyZuq7FxSUjIv+TX4XKwxv8ysU39k1WllOYT5kDwkOnJ5NLt4zqJQVQ==",
    type => "ssh-rsa" 
    }

  @plm-accounts::virtual { 'user2':
    uid      => 1006,
    realname => 'Testing User2',
    pass     => '$6$jNVwBfNV$S4JPdRZeEhv9vVGFfaafuW1AR7oKlfB8IPyHJlfOmSKvI2edNyzimpS/s./JF4xTg1hHX7.SXk6z/9NDs3DIc1'
    }
  @plm-accounts::add_ssh_key { user2:
    key     =>  "AAAAB3NzaC1yc2EAAAABJQAAAIBqOaxEVoWs69JM1H5jpzW7JvIwuanN4VW7F+uDVI1sii6BjROmYgYCvVoH+9/c3K5MNxqk35DHlFffgFk0b3o24Qa4RZZgxnUPTxsRIScaHQlr4/flYw643zVSwBpiEdBUfpRincUiaYfy6SCPu3aiKRyFgxZ6VByExrbHLwsz5w==",
    type => "ssh-rsa" 
    }
  
  @plm-accounts::virtual { 'user3':
    uid      => 1007,
    realname => 'Testing User3',
    pass     => '$6$jNVwBfNV$S4JPdRZeEhv9vVGFfaafuW1AR7oKlfB8IPyHJlfOmSKvI2edNyzimpS/s./JF4xTg1hHX7.SXk6z/9NDs3DIc1'
    }

}