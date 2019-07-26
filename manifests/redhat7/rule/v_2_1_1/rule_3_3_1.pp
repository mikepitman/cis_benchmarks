# 3.3 IPv6
# 3.3.1 Ensure IPv6 router advertisements are not accepted (Not Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_3_3_1 {
  $file = '/etc/sysctl.conf'
  if !defined(File[$file]) {
    file { $file:
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }

  sysctl { "net.ipv6.conf.all.accept_ra":
    ensure  => present,
    value   => '0',
    comment => '(3.3.1) - Ensure all IPv6 router advertisements are not accepted (Scored)'
  }
  file_line { '(3.3.1) - Ensure all IPv6 router advertisements are not accepted (Scored)':
    ensure => present,
    path   => $file,
    line   => 'net.ipv6.conf.all.accept_ra = 0',
    match  => '^net.ipv6.conf.all.accept_ra',
  }

  sysctl { "net.ipv6.conf.default.accept_ra":
    ensure  => present,
    value   => '0',
    comment => '(3.3.1) - Ensure default IPv6 router advertisements are not accepted (Scored)'
  }
  file_line { '(3.3.1) - Ensure default IPv6 router advertisements are not accepted (Scored)':
    ensure => present,
    path   => $file,
    line   => 'net.ipv6.conf.default.accept_ra = 0',
    match  => '^net.ipv6.conf.default.accept_ra',
  }


} #EOF
