class Goal < ApplicationRecord
  belongs_to :user
  # validates :aim, presence: true
  # validates :indicator, presence: true
  # validates :monthly_aim, presence: true 
  # validates :monthly_indicator, presence: true
  validates :user_id, presence: true
end
