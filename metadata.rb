maintainer       "Morphogenic Corp."
maintainer_email "alex@morphogenic.net"
license          "GNU GPL v2"
description      "Cookbook provides generic Rails implementation of the 'app'" +
                 " LWRP. Only configures the app server machine to properly" +
                 " take part in the RightScale ecosystem - up to you to deploy" +
                 " your app code via Capistrano or similar."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.6.1"

supports "centos"
supports "redhat"
supports "ubuntu"

depends "app"
depends "rightscale"

recipe "app_rails::setup_server",
  "Configures the server to host a Rails app."

recipe "app_rails::setup_app_user",
  "Setup the user/group account to execute the Rails application."

recipe "app_rails::install_rvm",
  "Install RVM."

attribute "repo/default/destination",
  :display_name => "Home Directory for Application",
  :description =>
    "Specify path that will host GIT repo.  Ex: /home/webapps",
  :default => "/home/webapps",
  :recipes => ["app::install_server", "app_rails::setup_server", "app_rails::setup_app_user"],
  :required => "optional"

attribute "web_apache/application_name",
  :display_name => "Application Name",
  :description =>
    "This will be used to create the app root path.  We're not using Apache but 'app' cookbook is hardcoded to look for this attribute when creating the app root dir",
  :default => "myapp",
  :recipes => ["app::install_server", "app_rails::setup_server"],
  :required => "optional"

attribute "app_rails/user",
  :display_name => "Rails User",
  :description => "The name of the user account that will execute the Rails application.",
  :default => "myuser",
  :recipes => ["app_rails::setup_app_user", "app_rails::install_rvm"],
  :required => "optional"

attribute "app_rails/group",
  :display_name => "Rails User Group",
  :description => "The name of the group account for the user that will execute the Rails application.",
  :default => "mygroup",
  :recipes => ["app_rails::setup_app_user"],
  :required => "optional"

attribute "app_rails/authorized_keys",
  :display_name => "Authorized SSH Keys",
  :description => "Public SSH keys for users allowed to deploy.",
  :default => "",
  :recipes => ["app_rails::setup_app_user"],
  :required => "optional"


