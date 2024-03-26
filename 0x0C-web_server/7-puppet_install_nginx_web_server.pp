# set up new ubuntu server with nginx

exec { 'update system': 
  command => '/usr/bin/apt-get -y update',
}

package { 'nginx':
  ensure   => 'installed',
  require  => Exec['update system']
}

service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx']
}

exec { 'allow_http':
  command  => 'usr/bin/ufw allow "Nginx HTTP"
}

file { '/var/www/html':
  ensure  => 'directory',
  owner   => $::id,
  group   => $::id,
  recurse => '0755'
}

file { '/var/www/html/index.nginx-debian.html':
  ensure   => 'file',
  content  => 'Hello World!'
}

exec { 'redirect_me': 
  command   => 'sed -i "24i\        rewrite ^/redirect_me https://ww.youtube.com/watch?vQH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
  provider  => 'shell',
  require   => Package['nginx'],
  notify    => Service['nginx']
}

service { 'nginx': 
  ensure    => 'running',
  require   => Package['nginx'],
  subscribe => Exec['redirect_me']
} 
