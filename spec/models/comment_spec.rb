require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    Comment.new(post: @post, user: @user, text: 'Hi Tom!')
  end

  before { subject.save }

  it 'should ensure text presence' do
    subject.text = nil
    expect(subject).to_not be_valid
  end

  it 'text must not exceed 255 characters' do
    subject.text = 'a' * 300
    expect(subject).to_not be_valid
  end

  it 'post should be present' do
    subject.post = nil
    expect(subject).to_not be_valid
  end

  it 'user should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end
end
