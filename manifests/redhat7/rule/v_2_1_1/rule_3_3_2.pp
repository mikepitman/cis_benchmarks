# 3.3 IPv6
# 3.3.2 Ensure IPv6 redirects are not accepted (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_3_3_2 {
  $file = '/etc/sysctl.conf'
  if !defined(File[$file]) {
    file { $file:
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }

  sysctl { "net.ipv6.conf.all.accept_redirects":
    ensure  => present,
    value => '0',
    comment => '(3.3.2) - Ensure all IPv6 redirects are not accepted (Scored)'
  }
  file_line { '(3.3.2) - Ensure all IPv6 redirects are not accepted (Scored)':
    ensure => present,
    path   => $file,
    line   => 'net.ipv6.conf.all.accept_redirects = 0',
    match  => '^net.ipv6.conf.all.accept_redirects',
  }

  sysctl { "net.ipv6.conf.default.accept_redirects":
    ensure  => present,
    value => '0',
    comment => '(3.3.2) - Ensure default IPv6 redirects are not accepted (Scored)'
  }
  file_line { '(3.3.2) - Ensure default IPv6 redirects are not accepted (Scored)':
    ensure => present,
    path   => $file,
    line   => 'net.ipv6.conf.default.accept_redirects = 0',
    match  => '^net.ipv6.conf.default.accept_redirects',
  }

} #EOF
