def sign_in user
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
end

def create_event event
	visit new_event_path
	fill_in "Address", with: event.address
	fill_in "Name", with: event.name
	click_button "Create"
end