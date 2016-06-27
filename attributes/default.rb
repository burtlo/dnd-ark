default['ark']['apache_mirror'] = 'http://apache.mirrors.tds.net'
default['ark']['prefix_root'] = '/usr/local'
default['ark']['prefix_bin'] = '/usr/local/bin'
default['ark']['prefix_home'] = '/usr/local'
default['ark']['tar'] = '/bin/tar'

pkgs = %w(libtool autoconf make unzip rsync gcc)
pkgs += %w(autogen) unless platform_family?('rhel')
pkgs += %w(xz-lzma-compat bzip2 tar) if platform_family?('rhel')
pkgs += %w(shtool pkg-config) if platform_family?('debian')

default['ark']['package_dependencies'] = pkgs
