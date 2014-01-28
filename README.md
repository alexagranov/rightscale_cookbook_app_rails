app_rails
=========

A Chef cookbook that implements RightScale's LWRP 'app' interface for a generic Rails app server on port 3000.

RightScale has some nice cookbooks for managing servers (attaching/detaching from ELB, monitoring, etc.).

I'd like to boot a new server that fits well into the RightScale ecosystem while still maintaining the ability to remotely deploy the actual app server code via Capistrano.
