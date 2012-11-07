require "spec_helper"
require "campus_data"

describe CampusData do
  it "should find Oliver" do
    data = CampusData.get_person_attributes(2040)
    p data
    data['first_name'].should == "Oliver"
  end
end
