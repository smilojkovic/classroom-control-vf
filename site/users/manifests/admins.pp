class users::admins {

  users::managed_user { 'jose': }
  users::managed_user { 'alice':}
  users::managed_user { 'chen' :
    group => 'staff',
}
  group { 'staff':
    ensure => present,
}
}
