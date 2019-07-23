# 3.1.2 Ensure packet redirect sending is disabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_3_1_2 {
  $file = '/etc/sysctl.conf'
  if !defined(File[$file]) {
    file { $file:
      ensure => file,
      owner  => root,
      group  => root,
      mode   => '0644',
    }
  }

  sysctl { "net.ipv4.conf.all.send_redirects":
    ensure  => present,
    value   => '0',
    comment => '(3.1.2) - Ensure packet all redirect sending is disabled (Scored)',
    #name      => 'net.ipv4.conf.all.send_redirects',
    #permanent => 'yes',
  }
  file_line { '(3.1.2) - Ensure packet all redirect sending is disabled (Scored)':
    ensure => present,
    path   => $file,
    line   => 'net.ipv4.conf.all.send_redirects = 0',
    match  => '^net.ipv4.conf.all.send_redirects',
  }

  sysctl { "net.ipv4.conf.default.send_redirects":
    ensure  => present,
    value => '0',
    comment => '(3.1.2) - Ensure packet default redirect sending is disabled (Scored)'
    #name  => 'net.ipv4.conf.default.send_redirects',
    #permanent => 'yes',
  }
  file_line { '(3.1.2) - Ensure packet default redirect sending is disabled (Scored)':
    ensure => present,
    path   => $file,
    line   => 'net.ipv4.conf.default.send_redirects = 0',
    match  => '^net.ipv4.conf.default.send_redirects',
  }


} #EOF
