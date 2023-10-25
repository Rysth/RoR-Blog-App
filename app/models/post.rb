class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end

=begin 
  
  CREATE | Queries to create Post

    first_post = Post.create(author_id: first_user.id, title: 'Hello', text: 'This is my first post')
    second_post = Post.create(author_id: first_user.id, title: 'olleH', text: 'This is my second post')
    third_post = Post.create(author_id: first_user.id, title: 'World', text: 'This is my third post')
    fourth_post = Post.create(author_id: first_user.id, title: 'Games', text: 'This is my fourth post')

  READ | Queries to get all the Post

    Post.all

  UPDATE | Queries to update a Post from a specific id.

    Post.find(first_post.id).update(title: 'Videogames')

  DELETE | Queries to delete a Post from a specific id.

    Post.find(first_post.id).destroy

=end