class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  after_save :post_counter_update

  def post_counter_update
    author.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
