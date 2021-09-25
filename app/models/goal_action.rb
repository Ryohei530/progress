class GoalAction < ApplicationRecord
  belongs_to :monthly_goal
  validates :content, presence: true
  validates :number, presence: true
  validates :monthly_goal, presence: true 
end
