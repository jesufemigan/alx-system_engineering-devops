# a puppet manifest that installs flask
package { 'flask':
  ensure  => '2.1.0',
  name    => flask,
  command => pip3 install flask,
}
