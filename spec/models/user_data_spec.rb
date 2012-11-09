require "spec_helper"

describe UserData do
  browser = Rack::Test::Session.new(Rack::MockSession.new(Api::UserApi))

  it "does not have an unknown user" do
    lambda {
      UserData.find('nonesuch')
    }.should raise_exception(ActiveRecord::RecordNotFound)
  end

  it "non-authorized user's GET /api/user/status" do
    response = browser.get "/api/user/status"
    JSON.parse(response.body)["logged_in"].should be == false
  end

  it "retrieve non-existent user info GET /api/user/1" do
    response = browser.get "/api/user/1"
    json_response = JSON.parse(response.body)
    json_response["uid"].should be == "1"
    json_response["preferred_name"].should be == ""
  end

  it "retrieve existing user info GET /api/user/2040" do
    response = browser.get "/api/user/2040"
    json_response = JSON.parse(response.body)
    json_response["uid"].should be == "2040"
    json_response["preferred_name"].should be == "Oliver Heyer"
  end

end
