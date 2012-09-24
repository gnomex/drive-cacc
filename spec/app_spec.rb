require 'spec_helper'

describe "Application" do
	it "root page" do
	  get '/'
	  last_response.status.should eql(200)
	end

	it "upload page" do
	  get '/upload'
	  last_response.status.should eql(200)
	end
end