require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'get#index' do
    before(:example) do
      get '/users'
    end

    it 'response status was correct.' do
      expect(response).to have_http_status(:ok)
    end

    it 'correct template was rendered' do
      expect(response).to render_template(:index)
    end

    it 'the response body includes correct placeholder text' do
      expect(response.body).to include('All User')
    end
  end

  before(:example) do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                       posts_counter: 0)
    get "/users/#{user.id}"
  end

  it 'response status was correct.' do
    expect(response).to have_http_status(:ok)
  end

  it 'correct template was rendered' do
    expect(response).to render_template(:show)
  end

  it 'the response body includes correct placeholder text' do
    expect(response.body).to include('Teacher from Mexico.')
  end
end
