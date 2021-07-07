class ReportAction < ApplicationRecord
  belongs_to :report
  default_scope -> { order(created_at: :desc) }
  validates :number, presence: true
end
