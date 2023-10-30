require 'rails_helper'

RSpec.describe "UsersControllers", type: :request do
  describe "GET /users" do
    it "return correct status" do
      get "/users"
      expect(response.status).to eq(200)
    end
  end
end
