module TasksHelper
	def format_completion(task)
		if task.complete
			"Completed"
		elsif task.overdue?
			"Overdue"
		else
			"Pending"
		end
	end
end
