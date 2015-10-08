class Task < ActiveRecord::Base
  belongs_to :group

  validates :title, presence: true

  validates :due_date, presence: true

  scope :pending, ->(group) { where(group_id: group.id).where(complete: false).order(:due_date) }
  scope :complete, ->(group) { where(group_id: group.id).where(complete: true).order(:due_date) }

  def due_today?
  	due_date == Date.today
  end

  def overdue?
  	due_date < Date.today
  end
end
