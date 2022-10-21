require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    Like.new(user: @user, post: @post)
  end

  before { subject.save }

  it 'post should be present' do
    subject.post = nil
    expect(subject).to_not be_valid
  end
  it 'usser should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end
end
