require 'rails_helper'

RSpec.describe 'PostsControllers', type: :request do
  before :each do
    @user1 = User.create(name: 'Abraha', photo: 'pending', bio: 'Developer from Ethiopia', posts_counter: 1)
    @post1 = Post.create(title: 'Post1', text: 'This is a test', user_id: @user1.id)
  end
  describe 'GET /index' do
    before(:each) { get user_posts_path(@user1, @post1) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    # it "renders 'index' template" do
    #   expect(response).to render_template('index')
    # end
  end
  describe 'GET /show' do
    before(:each) { get user_posts_path(@user1, @post1) }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    # it "renders 'show' template" do
    #   expect(response).to render_template('show')
    # end
  end
end
