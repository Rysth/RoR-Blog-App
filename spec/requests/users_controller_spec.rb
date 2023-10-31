require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /users' do
    it 'returns correct status' do
      get '/users'
      expect(response.status).to eq(200)
    end

    it 'returns the body correctly' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'contains the correct placeholder text' do
      get '/users'
      expect(response.body).to include('Here is the list of Users.')
    end
  end

  describe 'GET /users/:id' do
    before do
      @user = User.create(name: 'Test User', bio: 'Hello World, John!')
    end

    it 'returns correct status' do
      get "/users/#{@user.id}"
      expect(response.status).to eq(200)
    end

    it 'returns the body correctly' do
      get "/users/#{@user.id}"
      expect(response).to render_template(:show)
    end

    it 'contains the correct placeholder text' do
      get "/users/#{@user.id}"
      expect(response.body).to include('Here is the User information.')
    end
  end
end
