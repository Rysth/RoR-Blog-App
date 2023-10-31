require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    before do
      @user = User.create(name: 'Test User', bio: 'Hello World, John!')
    end

    it 'renders the show template' do
      get :show, params: { id: @user.id }
      expect(response).to render_template('show')
    end
  end
end
