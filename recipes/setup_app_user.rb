#
# Cookbook Name:: app_rails
#
# Copyright GNU GPL v2

rightscale_marker

log "  Setup the user/group account to execute the Rails application."

# create the group first
group node[:app_rails][:group] do
  action :create
  append true
end

# ...then create the user
user node[:app_rails][:user] do
  action :create
  gid node[:app_rails][:group]
  shell "/bin/bash"
  supports :manage_home => true
  home "/home/"+node[:app_rails][:user]
end

# make the .ssh directory
directory "/home/#{node[:app_rails][:user]}/.ssh" do
  owner "#{node[:app_rails][:user]}"
  group "#{node[:app_rails][:group]}"
  mode 00700
  action :create
end

# create the authorized_keys file with proper mode
auth_key_file = "/home/#{node[:app_rails][:user]}/.ssh/authorized_keys"
file auth_key_file do
  owner "#{node[:app_rails][:user]}"
  group "#{node[:app_rails][:group]}"
  mode 00600
  action :create
end

# allow authorized users to deploy over SSH as deploy user
bash "populate_authorized_keys" do
  code <<-EOH
    echo "#{node[:app_rails][:authorized_keys]}" > #{auth_key_file}
  EOH
end

# rvm group should have been made already by 'install_rvm' recipe
group "rvm" do
  action :modify
  append true
  members "#{node[:app_rails][:user]}"
end

# give deploy user ownership over deploy directory
execute "give deploy user ownership of deploy destination" do
  command "chown -R #{node[:app_rails][:user]}:#{node[:app_rails][:group]} #{node[:repo][:default][:destination]}"
end

# add deploy user to sudoers
bash "add deploy user to sudoers" do
  code <<-EOH
    echo "#{node[:app_rails][:user]} ALL=(ALL)NOPASSWD: ALL" >> /etc/sudoers
  EOH
end
