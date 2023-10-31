require 'rails_helper'

RSpec.describe 'PostsControllers', type: :request do
  describe 'GET /users/:user_id/posts' do
    before do
      @user = User.create(name: 'Test User', bio: 'Hello World, John!')
    end

    it 'return correct status' do
      get "/users/#{@user.id}/posts"
      expect(response.status).to eq(200)
    end

    it 'return the body correctly' do
      get "/users/#{@user.id}/posts"
      expect(response.body).not_to be_nil
    end

    it 'contains the correct placeholder text' do
      get "/users/#{@user.id}/posts"
      expect(response.body).to include('Here is the list of Posts.')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    before do
      @user = User.create(name: 'Test User', bio: 'Hello World, John!')
      @post = Post.create(author_id: @user.id, title: 'Test Post', text: 'Hello Post, John!')
    end

    it 'return correct status' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response.status).to eq(200)
    end

    it 'return the body correctly' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response.body).not_to be_nil
    end

    it 'contains the correct placeholder text' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response.body).to include('Here is the Post information from an specific User.')
    end
  end
end
