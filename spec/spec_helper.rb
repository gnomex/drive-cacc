ENV["RACK_ENV"] = "test"

require File.dirname(__FILE__) + "/../app"

require "rack/test"
require "pry"

Mongoid.raise_not_found_error = false

RSpec.configure do |config|
 	config.include Rack::Test::Methods

	def app
		Sinatra::Application
	end
end