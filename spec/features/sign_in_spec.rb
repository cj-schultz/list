require 'spec_helper'

describe "Signing in" do
	it "prompts for an email and password" do
		visit signin_path

		expect(page).to have_text("Email")
		expect(page).to have_text("Password")
	end

	it "signs in the user if the email/password combination is valid" do
		user = User.create!(user_attributes)

		visit signin_path
		
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password

		click_button "Sign In"

		expect(current_path).to eq(root_path)

		expect(page).to have_text("Welcome back, #{user.name}")

		expect(page).to have_link(user.name)
		expect(page).not_to have_link("Sign In")
		expect(page).not_to have_link("Sign Up")
		expect(page).to have_link("Sign Out")
	end

	it "does not sign in the user if the email/password combination is invalid" do
		user = User.create!(user_attributes)

		visit signin_path

		fill_in "Email", with: user.email
		fill_in "Password", with: "guess"

		click_button "Sign In"

		expect(page).to have_text("Invalid")

		expect(page).not_to have_link(user.name)
		expect(page).to have_link("Sign In")
		expect(page).to have_link("Sign Up")
		expect(page).not_to have_link("Sign Out")
	end
end