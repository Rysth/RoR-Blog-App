  class Post < ApplicationRecord
    belongs_to :user, class_name: 'User', foreign_key: 'author_id'
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy

    after_save :update_counter

    # Validation: Title must not be blank & Title must not exceed 250 characters.
    validates :title, presence: true, length: { maximum: 250 }

    # Validation: CommentsCounter must be an integer greater than or equal to zero.
    validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 } 

    # Validation: LikesCounter must be an integer greater than or equal to zero.
    validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 } 

    def recent_comments
      comments.order(created_at: :desc).limit(5)
    end

    private

    def update_counter
      user.update(posts_counter: user.posts.count)
    end
  end
