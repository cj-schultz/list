class Group < ActiveRecord::Base
	belongs_to :user

	has_many :tasks, dependent: :destroy

  validates :title, presence: true

  scope :pending, -> { where(complete: false).order(:due_date) }
  scope :complete, -> { where(complete: true).order(:due_date) }
end
