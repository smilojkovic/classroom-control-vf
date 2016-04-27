class nginx {
  File {
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
}

$mod_root = 'puppet:///modules/nginx'

  package { 'nginx':
    ensure => present,
}

  file { '/var/www':
    ensure => directory,
    mode => '0775',
}

  file { '/var/www/index.html':
    source => "${mod_root}/index.html",
}

  file { '/etc/nginx/nginx.conf':
    source =>  "${mod_root}/nginx.conf",
    require => Package['nginx'],
    notify => Service['nginx'],
}

  file { '/etc/nginx/conf.d':
    ensure => directory,
    mode => '0775',
}

  file { '/etc/nginx/conf.d/default.conf':
    source => "${mod_root}/default.conf",
    require => Package['nginx'],
    notify => Service['nginx'],
}

  service { 'nginx':
    ensure => running,
    enable => true,
}
}
