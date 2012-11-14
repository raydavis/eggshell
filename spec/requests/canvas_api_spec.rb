require "spec_helper"

describe "Canvas API" do
  it "should return a response for GET /api/canvas/mycourses" do
    get "/api/canvas/mycourses"
    response.should_not == nil
  end

  it "should return a fake response for GET /fake/api/canvas/mycourses" do
    get "/fake/api/canvas/mycourses"
    response.should_not == nil
  end
end
