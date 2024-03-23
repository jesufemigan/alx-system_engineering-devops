#edit config file to use private identity

file { '~/.ssh/config':
  ensure => present
}

file_line { 'add file identity': 
  path => '~/.ssh/config',
  line => 'IdentityFile '~/.ssh/school'
} 
