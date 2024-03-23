#edit config file to use private identity

file { '/etc/ssh/ssh_config':
  ensure => present
}

# file_line { 'remove password auth':
#  path => '/etc/ssh/ssh_config',
#  line => 'PasswordAuthentication no'
# }

file_line { 'add file identity':
  path => '/etc/ssh/ssh_config',
  line => 'IdentityFile ~/.ssh/school'
}
