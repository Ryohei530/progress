class MonthlyGoal < ApplicationRecord
  belongs_to :user
  has_many :goal_actions, dependent: :destroy
  accepts_nested_attributes_for :goal_actions, allow_destroy: true
  has_many :reports
end
