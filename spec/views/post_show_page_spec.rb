require 'rails_helper'

RSpec.describe 'Post show test', type: :feature do
  before(:each) do
    @user1 = User.create(id: 1, name: 'Deen', photo: 'https://www.google.com/image/1', bio: 'He is Abrahas friend',
                         post_counter: 2)
    @post = Post.create(
      author_id: @user1.id,
      title: 'Rails Magic',
      text: 'Rails has a lot of configuration issues :('
    )
    # three comments for posts by user1
    (1...3).each do |id|
      Comment.create(
        text: "This is comment #{id}",
        author_id: @user1.id,
        post_id: @post.id
      )
    end
    visit('/users/1/posts/1')
  end

  it 'should show post title' do
    expect(page).to have_content('Rails Magic')
  end
  it 'should show the author of the post' do
    expect(page).to have_content('Deen')
  end
  it 'should show comment count' do
    expect(page).to have_content('comments_counter: 3')
  end
  it 'should show likes count' do
    expect(page).to have_content('likes_counter: 0')
  end
  it 'should show commentor name' do
    expect(page).to have_content('Deen')
  end
  it 'should show the comment by the commentor' do
    expect(page).to have_content('This is comment 3')
  end
end
