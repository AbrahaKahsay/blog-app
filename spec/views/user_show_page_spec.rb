require 'rails_helper'

RSpec.describe 'User show test', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Abraha', photo: 'https://www.google.com/image/4',
                         bio: 'I am a developer from Ethiopia', posts_counter: 3)
    @post1 = Post.create(user_id: @user1.id, title: 'Animal Kingdom', text: 'Animals need freedom',
                         comments_counter: 0, likes_counter: 2)
    @post2 = Post.create(user_id: @user1.id, title: 'Education', text: 'Should be for wisdom', comments_counter: 0,
                         likes_counter: 2)
    @post3 = Post.create(user_id: @user1.id, title: 'Space-science', text: 'Will have great future discoveries',
                         comments_counter: 0, likes_counter: 2)

    visit user_path(@user1)
  end

  it 'It should show user photo' do
    expect(page.find('img')['src']).to have_content('https://www.google.com/image/4')
  end

  it 'It should show user name' do
    expect(page).to have_content(@user1.name)
  end

  it 'It should show user name' do
    expect(page).to have_content(@user1.bio)
  end

  it 'It should show posts count' do
    expect(page).to have_content('Number of posts: 3')
  end

  it 'It should show last three posts' do
    expect(page).to have_content(@post1.id)
    expect(page).to have_content(@post2.id)
    expect(page).to have_content(@post3.id)
  end

  it 'It should show last three posts' do
    expect(page).to have_link('See all posts')
  end

  it 'when user post is clicked it should redirect to posts show' do
    click_link 'Education'
    expect(page).to have_current_path(user_post_path(@user1, @post2))
  end
end
