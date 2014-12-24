# ODI Metrics Tasks

[![Build Status](http://jenkins.theodi.org/job/odi-metrics-tasks-master/badge/icon)](http://jenkins.theodi.org/job/odi-metrics-tasks-master/)
[![Dependency Status](https://gemnasium.com/theodi/odi-metrics-tasks.png)](https://gemnasium.com/theodi/odi-metrics-tasks)
[![Code Climate](https://codeclimate.com/github/theodi/odi-metrics-tasks.png)](https://codeclimate.com/github/theodi/odi-metrics-tasks)

[Feature documentation](https://relishapp.com/theodi/odi-metrics-tasks/docs) can be found on Relish.

Setup
-----

Add to gemfile:

    gem 'odi-metrics-tasks', :git => 'https://github.com/theodi/odi-metrics-tasks.git'

And require if necessary:

    require 'odi-metrics-tasks'

Configuration is loaded from environment variables. See the environment section below for the list of which variables must be set. The main one to make sure you add is `RESQUE_REDIS_SERVER`, which should be the hostname and port of the redis server where jobs should be queued.

License
-------

This code is open source under the MIT license. See the LICENSE.md file for 
full details.

Architecture
------------

This repository consists of a whole bunch of glue scripts which connect various other systems. They should all have the following features:

* Implemented as [resque jobs](https://github.com/defunkt/resque#section_Jobs).
* Minimal; each job should be as small as possible, spawing other jobs rather than executing big bits of code.
* Idempotent; they should be able to run many times with the same arguments and not cause problems.
* Testable; minimal jobs are very easy to test. This is generally done with cucumber features.

We use [VCR](https://github.com/vcr/vcr) to mock away any HTTP requests during tests.

Environment
-----------

The following environment variables should be set in order to use this gem.

    RESQUE_REDIS_HOST
    RESQUE_REDIS_PORT
    RESQUE_REDIS_PASSWORD (optional)
    
    EVENTBRITE_API_KEY
    EVENTBRITE_USER_KEY
    EVENTBRITE_ORGANIZER_ID
    
    XERO_CONSUMER_KEY
    XERO_CONSUMER_SECRET
    XERO_PRIVATE_KEY_PATH
    
    CAPSULECRM_ACCOUNT_NAME
    CAPSULECRM_API_TOKEN
    CAPSULECRM_DEFAULT_OWNER
    
    COURSES_RSYNC_PATH
    COURSES_TARGET_URL
    
    TRELLO_DEV_KEY
    TRELLO_DEV_SECRET
    TRELLO_MEMBER_KEY
    
    GITHUB_ORGANISATION
    GITHUB_OAUTH_TOKEN
    
    HUBOT_USER_LIST
    
    JENKINS_URL

    AIRBRAKE_API_KEY