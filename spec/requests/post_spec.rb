require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'index' do
    before(:example) do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         posts_counter: 0)
      get "/users/#{user.id}/posts"
    end

    it 'response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'correct template was rendered' do
      expect(response).to render_template(:index)
    end

    it 'the response body includes correct placeholder text' do
      expect(response.body).to include('All posts ')
    end
  end

  before(:example) do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                       posts_counter: 0)
    post = Post.new(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 2,
                    likes_counter: 2)
    get "/users/#{user.id}/posts/#{post.id}"
  end

  it 'response status was correct' do
    expect(response).to have_http_status(:ok)
  end

  it 'correct template was rendered' do
    expect(response).to render_template(:index)
  end

  it 'the response body includes correct placeholder text' do
    expect(response.body).to include('All posts ')
  end
end
