require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require 'csv'
Dir[File.expand_path("../../*.rb", __FILE__)].each {|file| require file }
Dir[File.expand_path("../*.rb", __FILE__)].each {|file| require file }
