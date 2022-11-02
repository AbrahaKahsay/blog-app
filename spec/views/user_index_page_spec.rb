require 'rails_helper'

RSpec.describe 'User test', type: :feature do
  describe 'index' do
    before(:each) do
      @user1 = User.create(id: 1, name: 'Tom', photo: 'https://www.google.com/image/1', bio: 'He is Abrahas friend',
                           posts_counter: 2)
      @user2 = User.create(id: 2, name: 'Youssef', photo: 'https://www.google.com/image/4',
                           bio: 'He is Abrahas best friend', posts_counter: 4)
      visit '/users'
    end
    it 'I can see the username of all other users' do
      expect(page).to have_content @user1.name
      expect(page).to have_content @user2.name
    end
    it 'I can see the profile picture for each user' do
      expect(page).to have_selector('img', count: 2)
    end
    it 'I can see the number of posts each user has written' do
      expect(page).to have_content('2')
      expect(page).to have_content('4')
    end
    it "When I click on a user, I am redirected to that user's show page" do
      click_on 'Tom'
      expect(page).to have_current_path('/users/1')
    end
    it 'shows the right content' do
      visit('/users')
      expect(page).to have_content('Tom')
    end
  end
end
