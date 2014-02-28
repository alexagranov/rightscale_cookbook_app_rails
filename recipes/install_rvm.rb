#
# Cookbook Name:: app_rails
#
# Copyright GNU GPL v2

rightscale_marker

log "  Install RVM as root."

bash "install_rvm" do
  code <<-EOH
    curl -sSL https://get.rvm.io | bash -s stable --ruby
  EOH
end

