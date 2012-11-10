require "spec_helper"

describe Api::Canvas do
  browser = Rack::Test::Session.new(Rack::MockSession.new(Api::Canvas))

  it "should redirect on GET /api/canvas/protected to /login" do
    browser.get "/api/canvas/protected"
    browser.follow_redirect!
    browser.last_request.path.should == "/login"
  end

  it "should return a response for GET /api/canvas/mycourses" do
    response = browser.get "/api/canvas/mycourses"
    p response
    response.should_not == nil
  end

  it "should return a fake response for GET /fake/api/canvas/mycourses" do
    response = browser.get "/fake/api/canvas/mycourses"
    response != nil
  end

end