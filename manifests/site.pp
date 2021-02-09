node default {
  file { '/root/README':
   ensure => true,
   content => 'This is my first file,
  }
 }
