#
# Cookbook Name:: app_rails
#
# Copyright GNU GPL v2

# @resource app

# Stops apache
action :stop do
  log "  Running stop sequence"
  service "apache2" do
    action :stop
    persist false
  end
end

action :start do
  log "  Running start sequence"
end

action :reload do
  log "  Running reload sequence"
end

action :restart do
  sleep 5
end

# Installs packages and modules required for PHP application server.
action :install do
  # nothing to do
  log "  Nothing to do for install."
end

