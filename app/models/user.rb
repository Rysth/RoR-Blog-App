class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def recent_post
    posts.order(created_at: :desc).limit(3)
  end
end

#
#
#   CREATE | Queries to create a User
#
#     first_user = User.create(name: 'Tom', 
#      photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
#      bio: 'Teacher from Mexico.')

#     second_user = User.create(name: 'Lilly', 
#     photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
#     bio: 'Teacher from Poland.')
#
#   READ | Queries to count all the User
#
#     User.count()
#
#   UPDATE | Queries to update all the User
#
#     User.all.update_all(name: 'John')
#
#   DELETE | Queries to delete a User by his name and from a specific id.
#
#     User.where(name: 'John').destroy_all
#
