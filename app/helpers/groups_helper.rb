module GroupsHelper
	def get_todays_tasks(group)
		tasks = []
  	group.tasks.each do |task|
  		if task.due_today? && !task.complete?
  			tasks << task
  		end
  	end
  	tasks
	end

	def get_overdue_tasks(group)
		tasks = []

		group.tasks.each do |task|
			if task.overdue? && !task.complete?
				tasks << task
			end
		end
		tasks
	end

	def pending_tasks(group)
		group.tasks.where(complete: false)
	end
end
