module ApplicationHelper
	def number_of_users
		User.count
	end
end
