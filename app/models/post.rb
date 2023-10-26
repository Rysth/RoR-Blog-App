class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_counter

  # Validation: Title must not be blank.
  validates :title, presence: true

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_counter
    user.update(posts_counter: user.posts.count)
  end
end
