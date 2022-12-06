require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'index' do
    before(:example) do
      @user = User.create(name: 'Yunus', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                          posts_counter: 0)
      @post = Post.create(author: @user, title: 'new post', text: 'I love posting', comments_counter: 0,
                          likes_counter: 0)
      Comment.create(author: @user, post: @post, text: 'I love comments')
      get "/users/#{@user.id}/posts"
    end

    it 'response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'correct template was rendered' do
      expect(response).to render_template(:index)
    end

    it 'the response body includes correct placeholder text' do
      expect(response.body).to include('Yunus')
    end
  end

  before(:example) do
    @user = User.create(name: 'Yunus', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                        posts_counter: 0)
    @post = Post.create(author: @user, title: 'new post', text: 'I love posting', comments_counter: 0,
                        likes_counter: 0)
    Comment.create(author: @user, post: @post, text: 'I love comments')
    get "/users/#{@user.id}/posts/#{@post.id}"
  end

  it 'response status was correct' do
    expect(response).to have_http_status(:ok)
  end

  it 'correct template was rendered' do
    expect(response).to render_template(:show)
  end

  it 'the response body includes correct placeholder text' do
    expect(response.body).to include('Yunus')
  end
end
