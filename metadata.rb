name 'devops-demo'
maintainer 'Darrin Wortlehock'
maintainer_email 'darrin@wortlehock.net'
license 'All rights reserved'
description 'Installs/Configures devops-demo'
long_description 'Installs/Configures devops-demo'
version IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue "0.0.0"

depends 'apt-docker', '~> 0.3.0'
depends 'gocd', '~> 1.1.1'
depends 'golang', '~> 1.7.0'
depends 'nginx', '~> 2.7.6'
depends 'ntp', '~> 1.10.1'
depends 'openvpn', '~> 2.1.0'
