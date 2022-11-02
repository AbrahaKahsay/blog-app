require 'rails_helper'

RSpec.describe 'Post index test', type: :feature do
  describe 'post' do
    before(:example) do
      @user1 = User.create(id: 1, name: 'Tom', photo: 'https://www.google.com/image/1', bio: 'He is Abrahas friend', post_counter: 2)
      @user2  = User.create(id: 2, name: 'Youssef', photo: 'https://www.google.com/image/4', bio: 'He is Abrahas best friend', post_counter: 4)
      
      2.times do |post|
        Post.create(title: "Post-#{post + 1}", text: 'We really suffered to get this working'
            ,comments_counter: 0, likes_counter: 0, id: post + 1, author_id: 1)
        end
        2.times do |comment|
            Comment.create(author_id: 1, post_id: 1, text: "Test comment #{comment + 1}")
            Like.create(author_id: 1, post_id: 1)
          end
     visit('/users/1/posts')
    end

    it "should show user\'s profile" do
        expect(page).to have_selector('img', 1)
    end
    it "should show user\'s user name" do
        expect(page).to have_content @user1.name
    end
    it "should show the number of posts the user has written." do
        expect(page).to have_content @user1.post_counter
    end
    it "should show the post'\s title" do
        expect(page).to have_content post.title
    end
    it "should show the post'\s body" do
        expect(page).to have_content post.text
    end
    
  end
end