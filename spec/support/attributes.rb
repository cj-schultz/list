def group_attributes(overrides = {})
  {
    title: "Math"
  }.merge(overrides)
end

def task_attributes(overrides = {})
	{
    title: "Task",
    due_date: Date.today.next_week,
    description: "This is a task",
    complete: false
  }.merge(overrides)
end

def user_attributes(overrides = {})
	{
		name: "Example User",
		email: "user@example.com",
		password: "secret",
		password_confirmation: "secret"
	}.merge(overrides)
end