ENV['SINATRA_ENV'] ||= 'development'
ENV['RACK_ENT'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

require_all 'app'
