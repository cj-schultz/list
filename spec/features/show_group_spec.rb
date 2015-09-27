require 'spec_helper'

describe "Viewing an individual group" do
  before do
    user = User.create!(user_attributes)
    sign_in(user)
  end

  it "shows the groups details and tasks" do
    group = Group.create!(group_attributes)
  	group.tasks.create!(task_attributes(title: "Task 1"))
  	group.tasks.create!(task_attributes(title: "Task 2"))
  	group.tasks.create!(task_attributes(title: "Task 3", complete: true))

    visit group_tasks_url(group)

    expect(page).to have_text(group.title)

    expect(page).to have_text("Task 1")
    expect(page).to have_text("Task 2")
    expect(page).to have_text("Task 3")
    expect(page).to have_text("2 Pending Tasks")
    expect(page).to have_text("1 Completed Task")
  end

  it "moves task into completed portion when it is checked off and the button is pressed" do
    group = Group.create!(group_attributes)
    group.tasks.create!(task_attributes(title: "Task 1"))
    group.tasks.create!(task_attributes(title: "Task 2"))
    group.tasks.create!(task_attributes(title: "Task 3", complete: true))

    visit group_tasks_url(group)

    expect(page).to have_text("1 Completed Task")

    find(:css, "#task_ids_[value='1']").set(true)

    click_on 'Complete Selected Tasks'

    expect(page).to have_text("2 Completed Task")
  end
end