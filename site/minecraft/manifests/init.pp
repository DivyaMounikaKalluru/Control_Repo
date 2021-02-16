class minecraft
{
file {'/opt/minecraft':
ensure => directory,
}
file {'/opt/minecraft/minecraft_server.jar':
ensure => file,
source => 'URL'
before => Service{'minecraft'},
}
package {'java':
ensure => present,
}
file {'/opt/minecraft/eula.txt':
ensure => file,
content => 'eula=true',
}
file {'/etc/systemd/system/minecraft.service':
ensure => file
source => 'puppet:///modules/minecraft/minecraft.service'
}
service {'minecraft':
ensure => running,
enable => true,
require => {Package{'java'}, File{'/opt/minecraft/eula.txt'}, File{'/etc/systemd/system/minecraft.service'}}
}
}
