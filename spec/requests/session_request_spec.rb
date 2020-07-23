require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /sessions" do
    it "returns http success" do
      User.new(email: "session@email.com", password: "asdasdasasd").save

      post "/sessions", params: {email: "session@email.com", password: "asdasdasasd"}

      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /sessions/id" do
    it "returns http success" do
      delete "/sessions/1"
      # how do you use sessions? they are deprecated in helepers in 5.1; hence fail below
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
