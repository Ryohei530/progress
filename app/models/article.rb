class Article < ApplicationRecord
  belongs_to :user
  has_many :article_comments, dependent: :destroy
  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags
  has_many :bookmarks, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  is_impressionable counter_cache: true

  def Article.search(search)
    return Article.all unless search

    Article.where(['title LIKE ?', "%#{search}%"])
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

  def bookmarked_by?(user)
    self.bookmarks.where(user_id: user).exists?
  end
end
