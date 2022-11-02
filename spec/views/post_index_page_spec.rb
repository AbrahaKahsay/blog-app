require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  describe 'Testing the post index:' do
    before(:example) do
      @user1 = User.create(name: 'Tom', photo: 'https://www.google.com/image/1', bio: 'He is Abrahas friend',
                           posts_counter: 2)
      @user2 = User.create(name: 'Youssef', photo: 'https://www.google.com/image/4',
                           bio: 'He is Abrahas best friend', posts_counter: 4)

      @post1 = Post.create(
        user_id: @user1.id,
        title: 'Rails is Magic',
        text: 'We really suffered to get this working',
        comments_counter: 1,
        likes_counter: 1
      )

      @comment1 = Comment.create(
        text: ' Yes rails is magic',
        post_id: @post1.id,
        user_id: @user1.id
      )

      @like1 = Like.create(user_id: 1, post_id: 1)

      visit user_posts_path(@user1)
    end

    it 'should show user profile' do
      expect(page.find('img')['src']).to have_content('https://www.google.com/image/1')
    end

    it 'should show user user name' do
      expect(page).to have_content('Tom')
    end

    it 'should show the number of posts the user has written.' do
      expect(page).to have_content(2)
    end
    it 'should show the post title' do
      expect(page).to have_content('Rails is Magic')
    end
    it 'should show the post body' do
      expect(page).to have_content('We really suffered to get this working')
    end
  end
end
