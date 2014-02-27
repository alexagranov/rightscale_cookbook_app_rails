#
# Cookbook Name:: app_rails
#
# Copyright GNU GPL v2

rightscale_marker

log "  Install RVM."

bash "install_rvm" do
  #user "#{node['app_rails']['user']}"
  cwd "/home/#{node['app_rails']['user']}"
  code <<-EOH
  echo "PWD >>>>"
  echo $PWD
  sudo su - #{node['app_rails']['user']}
  echo "after su >>>>"
  id
  echo "PWD >>>>"
  echo $PWD
  curl -sSL https://get.rvm.io | bash -s stable --ruby
  EOH
end

