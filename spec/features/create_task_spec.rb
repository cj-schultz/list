require 'spec_helper'

describe "Creating a new task" do
  before do
    @user = User.create!(user_attributes)
    sign_in(@user)
  end

  it "saves as a pending task and shows the new task's details" do
    group = Group.create!(group_attributes)

    visit group_tasks_path(group)

    click_link "Add Task"

    fill_in "Title", with: "New Task"
    fill_in "Description", with: "This is a new task, due on the default date"

    click_button "Create Task"

    expect(current_path).to eq(group_task_path(group, Task.last))

    expect(page).to have_text("New Task")
    expect(page).to have_text("This is a new task, due on the default date")
    expect(page).to have_text("Task successfully created")
    expect(page).to have_text("Pending")
  end

  it "does not save the task if it's invalid" do
    group = Group.create!(group_attributes)

    visit new_group_task_url(group)

    expect {
      click_button "Create Task"
    }.not_to change(Task, :count)

    expect(page).to have_text("error")
  end
end