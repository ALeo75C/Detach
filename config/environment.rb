# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#encoding: utf-8
Time::DATE_FORMATS[:date] = "%d %B, %k:%M" 
