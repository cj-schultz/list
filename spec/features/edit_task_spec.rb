require 'spec_helper'

describe "Editing a task" do
  before do
    @user = User.create!(user_attributes)
    sign_in(@user)
  end

  it "updates the task and shows the task's updated details" do
    group = Group.create!(group_attributes)
    task = group.tasks.create!(task_attributes)

    visit group_task_url(group, task)

    click_link "Edit Task"

    expect(current_path).to eq(edit_group_task_path(group, task))

    expect(find_field("Title").value).to eq(task.title)

    fill_in "Title", with: "Updated task title"

    click_button "Update Task"

    expect(current_path).to eq(group_task_path(group, task))

    expect(page).to have_text("Updated task title")
    expect(page).to have_text("Task successfully updated")
  end

  it "does not update the task if it is invalid" do
    group = Group.create!(group_attributes)
    task = group.tasks.create!(task_attributes)

    visit edit_group_task_path(group, task)

    fill_in "Title", with: ""

    click_button "Update Task"

    expect(page).to have_text("error")
  end
end