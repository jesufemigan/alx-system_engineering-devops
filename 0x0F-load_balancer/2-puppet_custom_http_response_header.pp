exec { 'HTTP header':
  command  => 'sudo sed -i "24i\        add_header X-Served-By \$hostname;" /etc/nginx/sites-available/default',
  provider => shell
}

exec { 'restart nginx':
  command => 'sudo service nginx restart',
}
