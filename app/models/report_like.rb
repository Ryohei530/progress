class ReportLike < ApplicationRecord
  belongs_to :user
  belongs_to :report
  validates :user_id, uniqueness: { scope: :report_id }
  validates :user_id, presence: true
end
