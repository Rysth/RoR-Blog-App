class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end

=begin 
  
  CREATE | Queries to create Comments

    Comment.create(post: first_post, user: second_user, text: 'Hi Tom!' )
    Comment.create(post: first_post, user: second_user, text: 'Hi John!' )
    Comment.create(post: first_post, user: second_user, text: 'Hi John 2!' )
    Comment.create(post: first_post, user: second_user, text: 'Hi Palacios!' )
    Comment.create(post: first_post, user: second_user, text: 'Hi Rysth!' )
    Comment.create(post: first_post, user: second_user, text: 'Hi Microverse!' )

  READ | Queries to get all the Comments from a specific Post.

    Comment.where(post_id: first_post.id)

  UPDATE | Queries to update a Comment from a specific User.

    Comment.find_by(user_id: second_user.id).update(text: 'Hello World!')

  DELETE | Queries to delete all the Comments from a specific User and Post.

    Comment.where(user_id: second_user.id, post_id: first_post.id).destroy_all

=end