require 'spec_helper'

describe "Deleting a task" do
	it "destroys the task and shows the task show page of the appropriate group" do
		user = User.create!(user_attributes)
		sign_in(user)
		
		group = Group.create!(group_attributes)
		task = Task.create!(task_attributes)

		visit group_task_path(group, task)

		click_link "Delete Task"

		expect(current_path).to eq(group_tasks_path(group))
		expect(page).to have_text("Task successfully deleted")
	end
end