require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Abraha', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer from Ethiopia.')
  end

  before do
    subject.save
  end

  it 'should ensure name presence' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should return valid for posts greater or equla to 0' do
    subject.posts_counter = 2
    expect(subject).to be_valid
  end
end
