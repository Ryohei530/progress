class MonthlyGoal < ApplicationRecord
  belongs_to :user
  has_many :goal_actions, dependent: :destroy, inverse_of: :monthly_goal
  accepts_nested_attributes_for :goal_actions, allow_destroy: true
  has_many :reports
  validates  :monthly_aim, presence: true
  validates  :monthly_indicator, presence: true
  validates  :term_start, presence: true
  validates  :term_end, presence: true
  validates  :user_id, presence: true
end
