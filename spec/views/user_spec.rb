require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before(:all) do
    @user = User.create(name: 'Ali', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',
                        posts_counter: 0)
    @post = Post.create(author: @user, title: 'new post', text: 'I love posting', comments_counter: 0,
                        likes_counter: 0)
    Post.create(author: @user, title: 'new post', text: 'I love posting', comments_counter: 0, likes_counter: 0)
    Post.create(author: @user, title: 'new post', text: 'Post 1', comments_counter: 0, likes_counter: 0)
    Post.create(author: @user, title: 'new post', text: 'Post 2', comments_counter: 0, likes_counter: 0)
  end

  describe 'index' do
    it 'shows names' do
      visit '/'
      expect(page).to have_content('Ali')
    end

    it 'there is an image' do
      visit '/'
      pg = page.all('img')
      expect(pg[0]['src']).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
    end

    it 'shows the number of posts' do
      visit '/'
      expect(page).to have_content('Number of posts: 4')
    end

    it 'when I click on a user, t redirects me show page' do
      visit '/'
      click_link 'Ali'
      expect(page).to have_current_path("/users/#{@user.id}")
    end

    it 'when I click on create post, it redirects new post' do
      visit '/'
      click_link 'create post'
      expect(page).to have_current_path('/posts/new')
    end
  end

  describe 'user page' do
    it 'shows t profile picture' do
      visit "/users/#{@user.id}"
      img = page.find('img')
      expect(img['src']).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
    end

    it 'username available' do
      visit "/users/#{@user.id}"

      expect(page).to have_content('Ali')
    end

    it 'posts counter available' do
      visit "/users/#{@user.id}"
      expect(page).to have_content('Number of posts: 4')
    end

    it ' users bio available' do
      visit "/users/#{@user.id}"
      expect(page).to have_content('Teacher from Poland.')
    end

    it 'when I click on see all post, it redirects new post index page' do
      visit "/users/#{@user.id}"
      click_link 'see all project'
      expect(page).to have_current_path("/users/#{@user.id}/posts")
    end

    it 'first 3 posts' do
      visit "/users/#{@user.id}"
      expect(page).to have_content('I love posting')
      expect(page).to have_content('Post 1')
      expect(page).to have_content('Post 2')
    end
  end
end
