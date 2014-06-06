require 'spec_helper'
require 'helpers/spec_test_helper'

describe "Sign in" do
  it "lets user sign in" do
  	user = create(:user)
	sign_in user
    expect(current_path).to eq root_path
  end
end

describe "Adds new event" do
	it "lets user make a new event" do
		user = create(:user)
		sign_in user
		event = build(:event)
		create_event event
		expect(page).to have_content("Test event")
	end
end

describe "sign up for event" do
	it "lets user sign up for event he just created" do
		user = create(:user)
		sign_in user
		event = build(:event)
		create_event event
		click_link "Sign up"
		expect(page).to have_content(user.email)
		expect(page).to have_content("see you there")
	end
	it "doesn't let user sign up for event if he's already in it" do
		user = create(:user)
		sign_in user
		event = build(:event)
		create_event event
		click_link "Sign up"
		click_link "Sign up"
		expect(page).to have_content("already signed up")
	end
end