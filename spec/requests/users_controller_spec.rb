require 'rails_helper'

RSpec.describe "UsersControllers", type: :request do
  describe "GET /users" do
    it "return correct status" do
      get "/users"
      expect(response.status).to eq(200)
    end
    it "return the body correctly" do
      get "/users"
      expect(response.body).not_to be_nil
    end
    it "contains the correct placeholder text" do
      get "/users"
      expect(response.body).to include("Here is the list of Users.")
    end
  end
end
