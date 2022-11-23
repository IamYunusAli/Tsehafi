require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                    posts_counter: 0)
    post = Post.new(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 2,
                    likes_counter: 2)
    Like.new(author: user, post:)
  end

  it 'Subject is  valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'Subject is valid with valid Author attributes' do
    expect(subject.author).to be_valid
  end

  it 'Subject is valid with valid Post attributes' do
    expect(subject.post).to be_valid
  end
end
