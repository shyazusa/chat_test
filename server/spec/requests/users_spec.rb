require "rails_helper"

RSpec.describe "/users" do
  describe "POST /users" do
    it "returns 200 ok when valid" do
      post "/users", params: {
        name: "四条 貴音",
        email: "takane@example.com",
        password: 'takane-123'
      }
      expect(response).to have_http_status :ok
    end

    it "returns 422 when inbalid" do
      post "/users", params: {}
      expect(response).to have_http_status :unprocessable_entity
    end
  end
end
