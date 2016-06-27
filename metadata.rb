name             'ark'
maintainer       'Franklin Webber'
maintainer_email 'frank@chef.io'
license          'Apache 2.0'
description      'Provides a custom resource for installing runtime artifacts in a predictable fashion'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

recipe 'ark::default', 'Installs packages needed by the custom resource'

%w(ubuntu centos).each do |os|
  supports os
end

depends 'build-essential'
