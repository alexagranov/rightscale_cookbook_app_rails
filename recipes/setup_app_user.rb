#
# Cookbook Name:: app_rails
#
# Copyright GNU GPL v2

rightscale_marker

log "  Setup the user/group account to execute the Rails application."

user node[:app_rails][:user] do
  gid node[:app_rails][:group]
  shell "/bin/bash"
  system true
  action :create
end

