# 3.2 Network Parameters (Host and Router)
# 3.2.2 Ensure ICMP redirects are not accepted (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_3_2_2 {
  $file = '/etc/sysctl.conf'
  if !defined(File[$file]) {
    file{ $file :
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
  sysctl { "net.ipv4.conf.all.accept_redirects":
    ensure      => present,
    value     => '0',
    comment   => '(3.2.2) - Ensure all ICMP redirects are not accepted (Scored)'
  }
  file_line { '(3.2.2) - Ensure all ICMP redirects are not accepted (Scored)':
    ensure => present,
    path   => $file,
    line   => 'net.ipv4.conf.all.accept_redirects = 0',
    match  => '^net.ipv4.conf.all.accept_redirects',
    }

    sysctl { "net.ipv4.conf.default.accept_redirects":
      ensure    => present,
      value     => '0',
      comment   => '(3.2.2) - Ensure default ICMP redirects are not accepted (Scored)'
    }
    file_line { '(3.2.2) - Ensure default ICMP redirects are not accepted (Scored)':
      ensure => present,
      path   => $file,
      line   => 'net.ipv4.conf.default.accept_redirects = 0',
      match  => '^net.ipv4.conf.default.accept_redirects',
      }


} #EOF
