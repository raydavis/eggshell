require 'spec_helper'

describe Api::Fake do
  browser = Rack::Test::Session.new(Rack::MockSession.new(Api::Fake))

  it "returns fake mycourses data" do
    lambda {
      Api::Fake.read_json %w(canvas mycourses)
    }.should_not be_nil
  end

  it "foo" do
    response = browser.get "/fake/api/canvas/mycourses"
    response != nil
  end

end