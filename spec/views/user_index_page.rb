require 'rails_helper'

RSpec.describe 'User test', type: :system do
  describe 'index' do
    before(:each) do
      @user1 = User.create(name: 'Tom', photo: 'https://www.google.com/image/1', bio: 'He is Abrahas friend', posts_counter: 2)
      @user2  = User.create(name: 'Youssef', photo: 'https://www.google.com/image/4', bio: 'He is Abrahas best friend', posts_counter: 4)
      visit '/'
    end

    it 'shows the right content' do
      visit('/users')
      expect(page).to have_content('Abraha')
    end

    it


  end
end
