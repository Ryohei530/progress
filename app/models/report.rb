class Report < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :report_actions, dependent: :destroy
  has_many :report_likes, dependent: :destroy
  has_many :liked_users, through: :report_likes, source: :user
  has_many :report_comments, dependent: :destroy
  has_many :replies, class_name: "ReportComment",
                     foreign_key: :reply_id,
                     dependent: :destroy
  belongs_to :monthly_goal
  
  accepts_nested_attributes_for :report_actions, allow_destroy: true
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :monthly_goal_id, presence: true
  validates :content, presence: true
  validates :images, content_type: { in: %w[image/jpeg image/gif image/png],
                                     message: "must be a valid image format" },
                     size: { less_than: 5.megabytes,
                             message: "should be less than 5MB" }
  
end
