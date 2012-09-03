# require "bundler"
require "bundler/setup"
Bundler.require(:default)

if Sinatra::Base.development?
	Bundler.require(:console, :development, ENV.fetch("RACK_ENV", :development))
	Wirb.start
	Hirb.enable
end

require File.expand_path("../environment", __FILE__)

Mongoid.load!(File.expand_path("../mongoid.yml", __FILE__))

Dir[File.expand_path("../../models/**/*", __FILE__)].each { |model| require model }