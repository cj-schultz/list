require 'spec_helper'

describe "The sidebar" do
	it "shows today's tasks" do
		user = User.create!(user_attributes)
		sign_in(user)

		group = user.groups.create!(group_attributes)
		task1 = group.tasks.create!(task_attributes(title: "Task 1", due_date: Date.today))
		task2 = group.tasks.create!(task_attributes(title: "Task 2", due_date: Date.today))
		task3 = group.tasks.create!(task_attributes(title: "Task 3"))

		visit root_url

		expect(page).to have_text("Today's Tasks")
		expect(page).to have_text(task1.title)
		expect(page).to have_text(task2.title)
		expect(page).not_to have_text(task3.title)
	end
end