ENV['SINATRA_ENV'] ||= 'development'
ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
Bundler.require(Sinatra::Base.environment)

require_all 'app'
