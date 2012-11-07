require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe UserData do
  browser = Rack::Test::Session.new(Rack::MockSession.new(Api::User))

  it "does not have an unknown user" do
    lambda {
      UserData.find('nonesuch')
    }.should raise_exception(ActiveRecord::RecordNotFound)
  end

  it "non-authorized user's GET /api/user/status" do
    response = browser.get "/api/user/status"
    JSON.parse(response.body)["logged_in"].should == false
  end

  it "retrieve user info GET /api/user/1" do
    response = browser.get "/api/user/1"
    JSON.parse(response.body)["uid"].should == "1"
  end

end
