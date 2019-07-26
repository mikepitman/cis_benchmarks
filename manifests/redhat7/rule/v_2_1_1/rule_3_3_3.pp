# 3.3 IPv6
# 3.3.3 Ensure IPv6 is disabled (Not Scored)
# Application of 3.3.3 has changed from v2.1.1. to v2.2.0
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_3_3_3 {
  $file = '/boot/grub2/grub.cfg'
  if !defined(File[$file]) {
    file { "(1.4.1) - ${file} ownership":
      ensure => file,
      path   => $file,
      owner  => 'root',
      group  => 'root',
      mode   => '0400',
    }
  }

  # herculesteam/augeasproviders_grub
  kernel_parameter { "ipv6.disable":
    ensure  => present,
    value   => "0",
  }

  file_line { '(3.3.3) - Ensure IPv6 is disabled (Not Scored L1)':
    ensure => present,
    path   => $file,
    line   => 'GRUB_CMDLINE_LINUX="ipv6.disable=1"',
    match  => '^GRUB_CMDLINE_LINUX.?=".*ipv6.disable=1.*$',
    replace => false,
  }


} #EOF