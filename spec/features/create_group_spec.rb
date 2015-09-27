require 'spec_helper'

describe 'Creating a new group' do
  before do 
    @user = User.create!(user_attributes)
    sign_in(@user)
  end

  it "saves the group and shows the new group's details" do
    visit groups_url

    click_link "Add New Group"

    expect(current_path).to eq(new_group_path)

    fill_in "Title", with: "Math"

    click_button "Create Group"

    expect(current_path).to eq(group_tasks_path(Group.last))

    expect(page).to have_text("Math")
    expect(page).to have_text("Group successfully created")
  end

  it "does not save the group and displays errors if it is invalid" do
    visit groups_url

    click_link "Add New Group"

    expect(current_path).to eq(new_group_path)

    expect {
      click_button 'Create Group'
    }.not_to change(Group, :count)

    expect(page).to have_text("Title can't be blank")
  end
end