require 'rails_helper'

RSpec.describe 'User test', type: :system do
  describe 'check the user page to have user name' do
    it 'shows the right content' do
      visit ('/users')
      expect(page).to have_content('Abraha')
    end
  end
end