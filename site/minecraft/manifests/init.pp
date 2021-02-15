class minecraft
{
file {'/opt/minecraft':
ensure => directory,
}
file {'opt/minecraft/minecraft_server.jar':
ensure => file,
source => 'URL'
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
}
}
