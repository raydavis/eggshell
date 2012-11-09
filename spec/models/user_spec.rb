require "spec_helper"

describe "User" do
  before(:each) do
    @random_id = Time.now.to_f.to_s.gsub(".", "")
    @default_name = "Joe Default"
    CampusData.stub(:get_person_attributes) do |uid|
      if uid == @random_id
        {'person_name' => @default_name}
      else
        {}
      end
    end
  end

  it "should find user with default name" do
    u = User.new(@random_id)
    u.preferred_name.should == @default_name
  end
  it "should override the default name" do
    u = User.new(@random_id)
    u.update_attributes(preferred_name: "Herr Heyer")
    u = User.new(@random_id)
    u.preferred_name.should == "Herr Heyer"
  end
  it "should revert to the default name" do
    u = User.new(@random_id)
    u.update_attributes(preferred_name: "Herr Heyer")
    u = User.new(@random_id)
    u.update_attributes(preferred_name: "")
    u = User.new(@random_id)
    u.preferred_name.should == @default_name
  end
end