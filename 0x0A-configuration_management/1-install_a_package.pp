# a puppet manifest that installs flask
package { 'Flask':
  ensure   => '2.1.0',
  name     => flask,
  command  => flask,
  provider => pip3
}
