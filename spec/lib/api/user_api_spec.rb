require "spec_helper"

describe Api::UserApi do
  browser = Rack::Test::Session.new(Rack::MockSession.new(Api::UserApi))

  it "non-authorized user's GET /api/user/status" do
    response = browser.get "/api/user/status"
    JSON.parse(response.body)["isLoggedIn"].should be == false
  end

  it "retrieve non-existent user info GET /api/user/0" do
    response = browser.get "/api/user/0"
    json_response = JSON.parse(response.body)
    json_response["uid"].should be == "0"
    json_response["preferredName"].should be == ""
  end

  it "retrieve existing user info GET /api/user/2040" do
    response = browser.get "/api/user/2040"
    json_response = JSON.parse(response.body)
    json_response["uid"].should be == "2040"
    json_response["preferredName"].should be == "Oliver Heyer"
  end

end
