# 1.4.1 Ensure permissions on bootloader config are configured - extended in 2.2.0 (Scored)
# 1.4.2 Ensure bootloader password is set (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_4_1 {
  $file_grub = '/boot/grub2/grub.cfg'
  $file_user = '/boot/grub2/user.cfg'

  if !defined(File[$file_grub]){
    file { "(1.4.1) - ${file_grub} ownership":
    ensure => file,
    path   => $file_grub,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }
}

  if !defined(File[$file_user]) {
    file { "(1.4.1) - ${file_user} ownership":
      ensure => file,
      path   => $file_user,
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
    }
  }
} #EOF
