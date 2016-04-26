class skeleton {
# create a directory      
  file { '/etc/skel':
    ensure => 'directory',
}    
# create file
  file { '/etc/skel/.bashrc':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/skeleton/bashrc'
}
    
}
