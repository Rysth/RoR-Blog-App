class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # Validation: Name must not be blank.
  validates :name, presence: true
  # Validation: PostsCounter must be an integer greater than or equal to zero.
  validate :posts_counter_greater_than_zero, 

  def recent_post
    posts.order(created_at: :desc).limit(3)
  end

  private

  def posts_counter_greater_than_zero
    if :posts_counter < 0
      errors.add(:posts_counter, 'PostsCounter must be an integer greater than or equal to zero.')
    end
  end
end
