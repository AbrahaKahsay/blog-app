require 'rails_helper'

RSpec.describe 'PostsControllers', type: :request do
  describe 'GET /index' do
    before(:each) { get user_posts_path(745) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'assigns all users to @posts' do
      expect(assigns(:posts)).to eq(Post.all)
    end

    it 'matches the placeholder text with the respone body' do
      expect(response.body).to include 'Here is a list of posts for a given user name'
    end
  end
  describe 'GET /show' do
    before(:each) { get '/users/745/posts/1' }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      expect(response).to render_template('show')
    end

    it 'matches the placeholder text with the respone body' do
      expect(response.body).to include 'Here is a list of posts for a given user id'
    end
  end
end
