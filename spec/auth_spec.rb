require "spec_helper"

describe "Authentication" do
  context "admin" do
    it "without credentials" do
      get '/admin'
      last_response.status.should eql(401)
    end

    it "with bad credentials" do
      authorize 'bad', 'pass'
      get '/admin'
      last_response.status.should eql(401)
    end

    it "with good credentials" do
      authorize 'admin', 'admin'
      get '/admin'
      last_response.status.should eql(200)
    end
  end

  it "restricts 'create discipline'" do
    post '/discipline', name: "Data Base"
    last_response.status.should eql(401)
  end

  it "restricts 'delete discipline'" do
    delete '/discipline', id: "123abc"
    last_response.status.should eql(401)
  end

  it "restricts 'create teacher'" do
    post '/teacher', name: "Angus Young"
    last_response.status.should eql(401)
  end

  it "restricts 'delete teacher'" do
    delete '/teacher', id: "321cba"
    last_response.status.should eql(401)
  end

end