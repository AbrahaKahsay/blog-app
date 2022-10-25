require 'rails_helper'

RSpec.describe 'UsersControllers', type: :request do
  describe 'GET /index' do
    before(:each) { get users_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'assigns all users to @users' do
      expect(assigns(:users)).to eq(User.all)
    end

    it 'matches the placeholder text with the respone body' do
      expect(response.body).to include 'Here is a list of users with name'
    end
  end

  describe 'GET /show' do
    before(:each) { get user_path(1) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'matches the placeholder text with the respone body' do
      expect(response.body).to include 'Here is a list of users with given id'
    end
  end
end
