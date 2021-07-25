class Post < ApplicationRecord
  belongs_to :user
  has_many :post_likes, dependent: :destroy
  has_many :liked_users, through: :post_likes, source: :user
  has_one_attached :image
  has_many :post_comments, dependent: :destroy
  has_many :replies, class_name: "PostComment",
                     foreign_key: :reply_id,
                     dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
                                    message: "must be a valid image format" },
                    size:         { less_than: 5.megabytes,
                                    message: "should be less than 5MB" }
  
  
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
  
end
