require 'spec_helper'

describe Task do
  it "belongs to a group" do
  	group = Group.create!(group_attributes)

  	task = group.tasks.new(task_attributes)

  	expect(task.group).to eq(group)
  end

  it "is valid with example attributes" do
  	task = Task.new(task_attributes)

  	expect(task.valid?).to eq(true)
  end

  it "requires a title" do
  	task = Task.new(title: "")

  	task.valid?

  	expect(task.errors[:title].any?).to eq(true)
  end

  it "requires a due date" do
  	task = Task.new(due_date: "")

  	task.valid?

  	expect(task.errors[:due_date].any?).to eq(true)
  end
end
