class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'
  after_save :update_posts_counter
  validates :title , presence: true , length: { maximum: 250 }
  validates : likes_counter, numericality: { greater_than_or_equal_to: 0 , only_integer: true }
  validates : comments_counter, numericality: { greater_than_or_equal_to: 0 , only_integer: true }

  def recent_comments
    comments.order('created_at desc').limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
