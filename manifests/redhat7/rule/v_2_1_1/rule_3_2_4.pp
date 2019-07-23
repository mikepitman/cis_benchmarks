# 3.2 Network Parameters (Host and Router)
# 3.2.4 Ensure suspicious packets are logged (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_3_2_4 {
  $file = '/etc/sysctl.conf'
  if !defined(File[$file]) {
    file{ $file :
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
  sysctl { "net.ipv4.conf.all.log_martians":
    ensure => present,
    value     => '1',
    comment   => '(3.2.4) - Ensure all suspicious packets are logged (Scored)'
  }
  file_line { '(3.2.4) - Ensure all suspicious packets are logged (Scored)':
    ensure => present,
    path   => $file,
    line   => 'net.ipv4.conf.all.log_martians = 1',
    match  => '^net.ipv4.conf.all.log_martians',
    }

    sysctl { "net.ipv4.conf.default.log_martians":
      ensure    => present,
      value     => '1',
      comment   => '(3.2.4) - Ensure default suspicious packets are logged (Scored)'
    }
    file_line { '(3.2.4) - Ensure default suspicious packets are logged (Scored)':
      ensure => present,
      path   => $file,
      line   => 'net.ipv4.conf.default.log_martians = 1',
      match  => '^net.ipv4.conf.default.log_martians',
      }


} #EOF
