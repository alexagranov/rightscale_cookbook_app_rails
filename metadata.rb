maintainer       "Morphogenic Corp."
maintainer_email "alex@morphogenic.net"
license          "GNU GPL v2"
description      "Cookbook provides generic Rails implementation of the 'app'" +
                 " LWRP. Only configures the app server machine to properly" +
                 " take part in the RightScale ecosystem - up to you to deploy" +
                 " your app code via Capistrano or similar."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.3.0"

supports "centos"
supports "redhat"
supports "ubuntu"

depends "app"
depends "rightscale"

recipe "app_rails::setup_server",
  "Configures the server to host a Rails app."

