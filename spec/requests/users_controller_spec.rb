require 'rails_helper'

RSpec.describe 'UsersControllers', type: :request do
  before :each do
    @user = User.create(name: 'Abraha', photo: 'pending', bio: 'Developer from Ethiopia', posts_counter: 1)
  end
  describe 'GET /index' do
    before(:each) { get users_path }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end

  describe 'GET /show' do
    before(:each) { get user_path(@user) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
  end
end
