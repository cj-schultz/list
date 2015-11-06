module UsersHelper
	def gather_todays_tasks(user)
		all_tasks = []

		user.groups.all.each do |group|
			group_tasks = get_todays_tasks(group)
			group_tasks.each do |task|
				all_tasks << task
			end		
		end

		all_tasks
	end

	def gather_overdue_tasks(user)
		all_tasks = []

		user.groups.all.each do |group|
			group_tasks = get_overdue_tasks(group)
			group_tasks.each do |task|
				all_tasks << task
			end		
		end

		all_tasks
	end
end
