require 'spec_helper'

describe "controllers/index" do
  before(:each) do
    assign(:controllers, [
      stub_model(Controller,
        :Events => "Events"
      ),
      stub_model(Controller,
        :Events => "Events"
      )
    ])
  end

  it "renders a list of controllers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Events".to_s, :count => 2
  end
end
