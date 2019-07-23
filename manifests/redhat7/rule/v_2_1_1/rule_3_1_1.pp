# 3.1 Network Parameters (Host Only)
# 3.1.1 Ensure IP forwarding is disabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_3_1_1 {
  $file = '/etc/sysctl.conf'
  if !defined(File[$file])  {
    file{ $file:
      ensure => file,
      owner  => root,
      group  => 'root',
      mode   => '0644',
    }
  }

  sysctl { "net.ipv4.ip_forward":
    ensure    => present,
    value     => '0',
    comment   => '(3.1.1) - Ensure IP forwarding is disabled (Scored)'
  }
  file_line { '(3.1.1) - Ensure IP forwarding is disabled (Scored)':
    ensure => present,
    path   => $file,
    line   => 'net.ipv4.ip_forward = 0',
    match  => '^net.ipv4.ip_forward',
    }



} #EOF
