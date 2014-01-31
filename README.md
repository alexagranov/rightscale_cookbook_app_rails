app_rails
=========

A Chef cookbook that implements RightScale's LWRP 'app' interface for a generic Rails app server.

RightScale has some nice cookbooks for managing servers (attaching/detaching from ELB, monitoring, etc.).

I'd like to boot a new server that fits well into the RightScale ecosystem while still maintaining the ability to remotely deploy the actual app server code via Capistrano.

You should still change your `app/port` input to `3000` (or whatever you like) for a standard Rails app, but this cookbook also exposes
    repo/default/destination
    web_apache/application_name

that are used by the 'app' cookbook to create the application root dir.
