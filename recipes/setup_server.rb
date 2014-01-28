#
# Cookbook Name:: app_rails
#
# Copyright GNU GPL v2

rightscale_marker

log "  Setting provider specific settings for Rails application server."
node[:app][:provider] = "app_rails"
node[:app][:port] = "3000"
node[:app][:version] = "0.1"
log "  Setting Rails application server version to 0.1"
