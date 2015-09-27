class Group < ActiveRecord::Base
	belongs_to :user

	has_many :tasks, dependent: :destroy

  validates :title, presence: true
end
