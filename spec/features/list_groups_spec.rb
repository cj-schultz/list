require 'spec_helper'

describe "Viewing the list of groups" do
  it "shows the groups" do
  	user = User.create!(user_attributes)
  	sign_in(user)

    group1 = user.groups.create!(group_attributes(title: "Math"))
    group2 = user.groups.create!(group_attributes(title: "CS"))
    group3 = user.groups.create!(group_attributes(title: "Science"))

    visit groups_url

    expect(page).to have_text(group1.title)
    expect(page).to have_text(group2.title)
    expect(page).to have_text(group3.title)
  end
end