require 'spec_helper'

describe "Navigating groups" do
  before do
    @user = User.create!(user_attributes)
    sign_in(@user)
  end

  it "allows navigation from the show page to the index page" do
    group = @user.groups.create!(group_attributes)

    visit group_tasks_url(group)

    click_link "All Groups"

    expect(current_path).to eq(groups_path)
  end

  it "allows navigation from the index page to the show page" do
    group = @user.groups.create!(group_attributes)

    visit groups_url

    click_link group.title

    expect(current_path).to eq(group_tasks_path(group))    
  end
end