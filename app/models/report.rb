class Report < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :report_actions
  accepts_nested_attributes_for :report_actions, allow_destroy: true
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
end
