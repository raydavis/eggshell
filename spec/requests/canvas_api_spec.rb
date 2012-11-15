require "spec_helper"

describe "Canvas API" do
  before :each, :auth => true do
    login_with_cas "191779"
  end

  it "should return a response for GET /api/canvas/mycourses", :auth => true do
    visit "/api/canvas/mycourses"
    page.source.should_not == nil
  end

  it "should return a fake response for GET /fake/api/canvas/mycourses" do
    visit "/fake/api/canvas/mycourses"
    page.source.should_not == nil
  end
end
