require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }

  it 'the given subject should be valid' do
    expect(subject).to be_valid
  end

  it 'the subject should not be valid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should be the Subjec name' do
    expect(subject.name).to eq 'Tom'
  end

  it 'bio should be the follwoing' do
    expect(subject.bio).to eq 'Teacher from Mexico.'
  end

  it 'posts counter should be initialized zerp' do
    expect(subject.posts_counter).to eq 0
  end

  it 'posts counter should increment while added' do
    subject.posts_counter += 1
    expect(subject.posts_counter).to eq 1
  end
end
