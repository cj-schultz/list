require 'spec_helper'

describe "Creating a user" do
	it "saves the user and shows the group listing page" do
		visit signup_url

		fill_in "Name", with: "Example User"
		fill_in "Email", with: "user@example.com"
		fill_in "Password - must be more than 5 characters long", with: "secret"
		fill_in "Confirm Password", with: "secret"

		click_button "Create Account"

		expect(current_path).to eq(user_path(User.last))

		expect(page).to have_text("Account successfully created!")
		expect(page).to have_link(User.last.name)
		expect(page).not_to have_link("Sign In")
		expect(page).not_to have_link("Sign Up")
	end

	it "does not save the user if it's invalid" do
    visit signup_url

    expect {
      click_button 'Create Account'
    }.not_to change(User, :count)

    expect(page).to have_text('error')
  end
end