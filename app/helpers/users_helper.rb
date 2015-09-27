module UsersHelper
	def gather_tasks(user)
		all_tasks = []

		user.groups.all.each do |group|
			group_tasks = get_todays_tasks(group)
			group_tasks.each do |task|
				all_tasks << task
			end		
		end

		all_tasks
	end
end
