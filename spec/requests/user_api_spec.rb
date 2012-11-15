require "spec_helper"

describe "user API" do
  before :each, :auth => true do
    login_with_cas "192517"
  end

  it "should not have a logged-in status" do
    get "/api/user/status"
    assert_response :success
    p response
    JSON.parse(response.body)["isLoggedIn"].should be == false
  end

  it "should have a logged-in status and then logout", :auth => true do
    visit "/api/user/status"
    json_response = JSON.parse(page.source)
    json_response["isLoggedIn"].should be == true
    json_response["uid"].should be == "192517"

    logout_of_cas
    visit "/api/user/status"
    json_response = JSON.parse(page.source)
    json_response["isLoggedIn"].should be == false;
  end

  it "should not have a preferred name for a non-existent user" do
    get "/api/user/0"
    json_response = JSON.parse(response.body)
    json_response["uid"].should be == "0"
    json_response["preferredName"].should be == ""
  end

  it "should retrieve data for a known user" do
    get "/api/user/192517"
    json_response = JSON.parse(response.body)
    json_response["uid"].should be == "192517"
    json_response["preferredName"].should be == "Yu-Hung Lin"
  end

end
