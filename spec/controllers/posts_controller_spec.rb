require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    before do
      @user = User.create(name: 'Test User', bio: 'Hello World, John!')
    end
    
    it 'renders the index template' do
      get :index, params: { user_id: @user.id }
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    before do
      @user = User.create(name: 'Test User', bio: 'Hello World, John!')
      @post = Post.create(author_id: @user.id, title: 'Test Post', text: 'Hello Post, John!')
    end

    it 'renders the show template' do
      get :show, params: { user_id: @user.id, id: @post.id }
      expect(response).to render_template('show')
    end
  end
end
