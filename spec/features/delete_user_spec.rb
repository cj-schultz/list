require 'spec_helper'

describe "Deleting a user" do
	it "destroys the user and redirects to the welcome page" do
    user = User.create!(user_attributes)
    sign_in(user)

    visit user_path(user)

    click_link 'Delete Account'

    expect(current_path).to eq(welcome_path)
    expect(page).to have_text('Account successfully deleted!')

    visit users_path

    expect(page).not_to have_text(user.name)
  end

  it "automatically signs out that user" do
  	user = User.create!(user_attributes)
  	sign_in(user)

  	visit user_path(user)

  	click_link "Delete Account"
  	
  	expect(page).to have_link("Sign In")
  	expect(page).to have_link("Sign Up")
  	expect(page).not_to have_link("Sign Out")
  end
end