class User < ApplicationRecord
  
  has_many :posts, dependent: :destroy
  has_one :goal, dependent: :destroy
  has_many :goal_actions, through: :monthly_goals
  has_many :reports, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :boards, dependent: :destroy
  has_many :article_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :liked_posts, through: :post_likes, source: :post 
  has_many :report_likes, dependent: :destroy
  has_many :liked_reports, through: :report_likes, source: :report
  has_many :report_comments, dependent: :destroy
  has_many :board_comments, dependent: :destroy
  has_many :running_days, dependent: :destroy
  has_many :monthly_goals, dependent: :destroy
  has_one_attached :avatar
  attr_accessor :remember_token
  before_save :downcase_email
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_secure_password
  validates :avatar, content_type: { in: %w[image/jpeg image/gif image/png],
                                     message: "jpeg, gif, png形式のみアップロード可能です" },
                     size:         { less_than: 5.megabytes,
                                     message: "5MBを超える画像はアップロードできません" }
   
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  def User.new_token 
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def feed
    Post.where("user_id = ?", id)
  end
  
  def post_liked?(post)
    self.post_likes.exists?(post_id: post.id)
  end
  
  def report_liked?(report)
    self.report_likes.exists?(report_id: report.id)
  end
  
  def default_image
    unless self.avatar.attached?
      self.avatar.attach(io: File.open('./app/assets/images/default.png'), filename: 'default.png', content_type: 'image/png')
    end
  end
  
  private
    
    def downcase_email
      self.email = email.downcase
    end
end
