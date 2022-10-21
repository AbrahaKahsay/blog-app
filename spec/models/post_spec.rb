require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.new(name: 'Abraha', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer from Ethiopia.')
    @post = Post.new(user: @user, title: 'I Love Rails', text: 'This is my first post')
  end

  before do
    @user.save
    @post.save
  end

  it 'should ensure title presence' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'title sholud have 200 characters' do
    @post.title = 'a' * 280
    expect(@post).to_not be_valid
  end
  it 'Comments counter should be an integer' do
    @post.comments_counter = 1
    expect(@post).to_not be_valid
  end
  it 'Likes counter should be an positive integer' do
    @post.likes_counter = -1
    expect(@post).to_not be_valid
  end

  it 'Likes counter should be greater than or equal to 0' do
    @post.likes_counter = -1
    expect(@post).to_not be_valid
  end
end
