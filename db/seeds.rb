User.create!(name: "Example 1", email: "1@example.com", password: "secret1", password_confirmation: "secret1")
User.create!(name: "Example 2", email: "2@example.com", password: "secret2", password_confirmation: "secret2")

user1 = User.find(1)
user2 = User.find(2)
users = [user1, user2]
users.each do |user|
	user.groups.create!(title: "Math (user #{user.id})")
	user.groups.create!(title: "Science (user #{user.id})")
	user.groups.create!(title: "CS (user #{user.id})")
	user.groups.create!(title: "Political Science (user #{user.id})")
end

group = user1.groups[0]
group.tasks.create!(title: "Math Assignment 1", due_date: "2015-08-30", description: "My first math assignment, due in recitation", complete: false)
group.tasks.create!(title: "Math Assignment 2", due_date: "2015-09-02", description: "My second math assignment, due in class", complete: false)
group.tasks.create!(title: "Math Assignment 3", due_date: "2015-09-10", description: "My third math assignment, due online", complete: false)
group.tasks.create!(title: "Math Assignment 4", due_date: "2015-11-23", description: "My fourth math assignment", complete: false)

group = user1.groups[1]
group.tasks.create!(title: "Science Assignment 1", due_date: "2015-08-30", description: "Remeber to email TA about question number 3", complete: false)
group.tasks.create!(title: "Science Assignment 2", due_date: Date.today, description: "Notes are online", complete: false)
group.tasks.create!(title: "Science Assignment 3", due_date: "2015-09-10", description: "This is due on the second class of this week", complete: false)

group = user1.groups[2]
group.tasks.create!(title: "CS Assignment 1", due_date: "2015-08-30", description: "My first CS assignment, start early!", complete: false)
group.tasks.create!(title: "CS Assignment 2", due_date: "2015-09-02", description: "I want to start this assignment by tomorrow", complete: false)
group.tasks.create!(title: "CS Assignment 3", due_date: "2015-09-10", description: "Email proffessor about question number 4", complete: false)

group = user1.groups[3]
group.tasks.create!(title: "Poly-sci Assignment 1", due_date: "2015-12-30", description: "What a boring class", complete: false)
group.tasks.create!(title: "Poly-sci Assignment 2", due_date: "2016-02-12", description: "Hand in online before 11:59 PM", complete: false)
group.tasks.create!(title: "Poly-sci Assignment 3", due_date: Date.today, description: "This is due today, get it done before work", complete: false)

group = user2.groups[0]
group.tasks.create!(title: "Math Assignment 1", due_date: "2015-08-30", description: "My first math assignment, due in recitation", complete: false)
group.tasks.create!(title: "Math Assignment 2", due_date: "2015-09-02", description: "My second math assignment, due in class", complete: false)
group.tasks.create!(title: "Math Assignment 3", due_date: "2015-09-10", description: "My third math assignment, due online", complete: false)
group.tasks.create!(title: "Math Assignment 4", due_date: "2015-11-23", description: "My fourth math assignment", complete: false)

group = user2.groups[1]
group.tasks.create!(title: "Science Assignment 1", due_date: "2015-08-30", description: "Remeber to email TA about question number 3", complete: false)
group.tasks.create!(title: "Science Assignment 2", due_date: Date.today, description: "Notes are online", complete: false)
group.tasks.create!(title: "Science Assignment 3", due_date: "2015-09-10", description: "This is due on the second class of this week", complete: false)

group = user2.groups[2]
group.tasks.create!(title: "CS Assignment 1", due_date: "2015-08-30", description: "My first CS assignment, start early!", complete: false)
group.tasks.create!(title: "CS Assignment 2", due_date: "2015-09-02", description: "I want to start this assignment by tomorrow", complete: false)
group.tasks.create!(title: "CS Assignment 3", due_date: "2015-09-10", description: "Email proffessor about question number 4", complete: false)

group = user2.groups[3]
group.tasks.create!(title: "Poly-sci Assignment 1", due_date: "2015-12-30", description: "What a boring class", complete: false)
group.tasks.create!(title: "Poly-sci Assignment 2", due_date: "2016-02-12", description: "Hand in online before 11:59 PM", complete: false)
group.tasks.create!(title: "Poly-sci Assignment 3", due_date: Date.today, description: "This is due today, get it done before work", complete: false)