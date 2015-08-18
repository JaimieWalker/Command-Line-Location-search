require 'bundler/setup'
require_relative '../app/runners/googlemaps_cli.rb'

Bundler.require(:default, :development)
$: << '.'

Dir["app/concerns/*.rb"].each {|f| require f}
Dir["app/models/*.rb"].each {|f| require f}
Dir["app/data_fetchers/*.rb"].each {|f| require f}
Dir["app/runners/*.rb"].each {|f| require f}

require "open-uri"
require "json"
require "rest-client"
require "openssl"
