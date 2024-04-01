# a puppet file that set up an ubuntu server with nginx
exec { 'update_system':
  command => '/usr/bin/apt-get -y update',
}

package { 'nginx':
  ensure  => 'installed',
  require => Exec['update_system'],
}

service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}

exec { 'allow_http':
  command => '/usr/sbin/ufw allow "Nginx HTTP"',
  unless  => '/usr/sbin/ufw status | grep "Nginx HTTP"',
}

file { '/var/www/html':
  ensure  => 'directory',
  owner   => $::id,
  group   => $::id,
  recurse => true,
  mode    => '0755',
}

file { '/var/www/html/index.nginx-debian.html':
  ensure  => 'file',
  content => 'Hello World!',
}

exec { 'backup_index':
  command => '/bin/cp /var/www/html/index.nginx-debian.html /var/www/html/index.html.nginx-debian.html.bckp',
  creates => '/var/www/html/index.html.nginx-debian.html.bckp',
}

file { '/etc/nginx/sites-available/default':
  ensure  => 'file',
}

exec { 'add_rewrite_rule':
  command   => 'sed -i "24i\        rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
  provider  => 'shell',
  require   => Package['nginx'],
  subscribe => File['/etc/nginx/sites-available/default'],
  notify    => Service['nginx'],
}

exec { 'add_header_rule':
  command   => 'sed -i "25i\        add_header X-Served-By $hostname;" /etc/nginx/sites-available/default',
  provider  => 'shell',
  require   => Package['nginx'],
  subscribe => File['/etc/nginx/sites-available/default'],
  notify    => Service['nginx'],
}
