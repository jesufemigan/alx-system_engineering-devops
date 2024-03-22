# a file that creates a file /tmp/school
file { '/tmp/school':
  ensure  => present,
  path    => '/tmp/school',
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
  content => 'I love Puppet'
}
