require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')

describe UserData do
  it "does not have an unknown user" do
    lambda {
      UserData.find('nonesuch')
    }.should raise_exception(ActiveRecord::RecordNotFound)
  end
end
