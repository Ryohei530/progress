class Board < ApplicationRecord
  belongs_to :user
  has_many :board_comments, dependent: :destroy
  has_many :board_tags
  has_many :tags, through: :board_tags
  
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  
  def Board.search(search)
    return Board.all unless search
    Board.where(['title LIKE ?', "%#{search}%"])
  end
  
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags
    
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end
    
    new_tags.each do |new|
      new_article_tag = Tag.find_or_create_by(name: new)
      self.tags << new_article_tag
    end
  end
end
