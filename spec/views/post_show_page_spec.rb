require 'rails_helper'

RSpec.describe 'Post show test', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Deen', photo: 'https://www.google.com/image/1', bio: 'He is Abrahas friend',
                         posts_counter: 2)
    @post1 = Post.create(
      user_id: @user1.id,
      title: 'Rails Magic',
      text: 'Rails has a lot of configuration issues :(',
      comments_counter: 3,
      likes_counter: 1
    )
    # three comments for posts by user1
    (1..3).each do |id|
      Comment.create(
        text: "This is comment #{id}",
        user_id: @user1.id,
        post_id: @post1.id
      )
    end
    visit user_posts_path(@user1)
  end

  it 'should show post title' do
    expect(page).to have_content('Rails Magic')
  end
  it 'should show the author of the post' do
    expect(page).to have_content('Deen')
  end
  it 'should show comment count' do
    expect(page).to have_content(@post1.comments_counter)
  end
  it 'should show likes count' do
    expect(page).to have_content(@post1.likes_counter)
  end
  it 'should show commentor name' do
    expect(page).to have_content('Deen')
  end
end
