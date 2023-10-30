require 'rails_helper'

RSpec.describe 'PostsControllers', type: :request do
  describe 'GET /users/:user_id/posts' do
    it 'return correct status' do
      get '/users/1/posts'
      expect(response.status).to eq(200)
    end
    it 'return the body correctly' do
      get '/users/1/posts'
      expect(response.body).not_to be_nil
    end
    it 'contains the correct placeholder text' do
      get '/users/1/posts'
      expect(response.body).to include('Here is the list of Posts.')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'return correct status' do
      get '/users/1/posts/1'
      expect(response.status).to eq(200)
    end
    it 'return the body correctly' do
      get '/users/1/posts/1'
      expect(response.body).not_to be_nil
    end
    it 'contains the correct placeholder text' do
      get '/users/1/posts/1'
      expect(response.body).to include('Here is the Post information from an specific User.')
    end
  end
end
