#!/usr/bin/pup
# a puppet manifest that installs flask
package { 'Flask':
  ensure   => '2.1.0',
  provider => pip3
}
