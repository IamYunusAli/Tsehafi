require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                    posts_counter: 0)
    Post.new(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 2,
             likes_counter: 2)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'given post have a valid Author' do
    expect(subject.author).to be_valid
  end

  it 'The Subject title is correct' do
    expect(subject.title).to be_eql('Hello')
  end

  it 'The subject comment counter is an Integer' do
    expect(subject.comments_counter).to be_an(Integer)
  end
end
