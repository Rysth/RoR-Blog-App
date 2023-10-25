class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
end

=begin 
  Queries to create Comments

  Comment.create(post_id: first_post.id, user_id: second_user.id, text: 'Hi Tom!' )
  Comment.create(post_id: first_post.id, user_id: second_user.id, text: 'Hi John!' )
  Comment.create(post_id: first_post.id, user_id: second_user.id, text: 'Hi John 2!' )
  Comment.create(post_id: first_post.id, user_id: second_user.id, text: 'Hi Palacios!' )
  Comment.create(post_id: first_post.id, user_id: second_user.id, text: 'Hi Rysth!' )
  Comment.create(post_id: first_post.id, user_id: second_user.id, text: 'Hi Microverse!' )
=end