require 'spec_helper'

describe "A group" do
  it "requires a title" do
    group = Group.new(title: "")

    group.valid?

    expect(group.errors[:title].any?).to eq(true)
  end

  it "is valid with example attributes"  do
    group = Group.new(group_attributes)

    expect(group.valid?).to eq(true)
  end

  it "has many tasks" do
    group = Group.create!(group_attributes)
    task1 = group.tasks.new(task_attributes)
    task2 = group.tasks.new(task_attributes)

    expect(group.tasks).to include(task1)
    expect(group.tasks).to include(task2)
  end

  it "deletes associated tasks" do
    group = Group.create!(group_attributes)

    group.tasks.create!(task_attributes)

    expect {
      group.destroy
    }.to change(Task, :count).by(-1)
  end
end