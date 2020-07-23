require "rails_helper"

RSpec.describe "Users", type: :request do

  describe "POST /users" do
    it "returns http success" do
      post "/users", params: {email: "user@email.com", password: "asdasdasa12ds"}
    
      expect(User.load("user@email.com")).to_not be nil
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /users" do
    it "returns http success" do
      post "/sessions", params: {email: "user@email.com", password: "asdasdasa12ds"}
      patch "/users/1", params: {email: "user@email.com", password: "1asdasdasa12ds2"}

      user = User.load("user@email.com")
      expect(user.authenticate("1asdasdasa12ds")).to_not be nil
      expect(response).to have_http_status(:success)
    end
  end
end
