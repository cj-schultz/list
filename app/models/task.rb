class Task < ActiveRecord::Base
  belongs_to :group

  validates :title, presence: true

  validates :due_date, presence: true

  def due_today?
  	due_date == Date.today
  end

  def overdue?
  	due_date < Date.today
  end
end
