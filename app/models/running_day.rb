class RunningDay < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :start_date, presence: true
  validates :date, presence: true
  validates :s_or_c, inclusion: { in: [true, false] }
  validates :r_days, presence: true
end