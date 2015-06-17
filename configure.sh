#!/usr/bin/env bash
bundle install
figaro install
rails g devise:install
rake db:migrate
rake db:seed
