require "spec_helper"

describe "user API" do
  it "should not have a logged-in status" do
    get "/api/user/status"
    assert_response :success
    p response
    JSON.parse(response.body)["isLoggedIn"].should be == false
  end

  it "should not have a preferred name for a non-existent user" do
    get "/api/user/0"
    json_response = JSON.parse(response.body)
    json_response["uid"].should be == "0"
    json_response["preferredName"].should be == ""
  end

  it "should retrieve data for a known user" do
    get "/api/user/2040"
    json_response = JSON.parse(response.body)
    json_response["uid"].should be == "2040"
    json_response["preferredName"].should be == "Oliver Heyer"
  end

end
