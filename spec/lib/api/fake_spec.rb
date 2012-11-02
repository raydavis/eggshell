require 'spec_helper'

describe Api::Fake do

  it "returns fake mycourses data" do
    lambda {
      Api::Fake.read_json %w(canvas mycourses)
    }.should_not be_nil
  end

end