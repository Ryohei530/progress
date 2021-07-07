class GoalAction < ApplicationRecord
  belongs_to :goal
  validates :content, presence: true
  validates :number, presence: true
  #validates :goal_id, presence: true 
end
