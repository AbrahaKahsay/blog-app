require 'rails_helper'

RSpec.describe "UsersControllers", type: :request do
  describe "GET /index" do
    before(:each) { get users_path }
    it "is a success" do
      expect(response).to have_http_status(:ok)
    end
  end
end
