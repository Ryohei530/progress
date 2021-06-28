class Goal < ApplicationRecord
  belongs_to :user
  has_many :goal_actions, dependent: :destroy
  accepts_nested_attributes_for :goal_actions, allow_destroy: true
  validates :aim, presence: true
  validates :indicator, presence: true
  validates :monthly_aim, presence: true 
  validates :monthly_indicator, presence: true
  validates :user_id, presence: true
end
