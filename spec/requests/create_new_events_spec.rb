require 'spec_helper'

describe "CreateNewEvents" do
  it "creates a new Event" do
    @event = FactoryGirl.create(:event)
    @event.name.should eq "Test event"
    
  end
end
