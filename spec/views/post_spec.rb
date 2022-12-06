require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  before(:all) do
     @user= User.create(name: 'Yunus',photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', posts_counter: 0)
     @post= Post.create(author: @user, title: 'new post', text: 'I love posting', comments_counter:0, likes_counter:0)
     Post.create(author: @user, title: 'new post', text: 'I love posting', comments_counter:0, likes_counter:0)
     Post.create(author: @user, title: 'new post', text: 'Post 16', comments_counter:0, likes_counter:0)
     Post.create(author: @user, title: 'new post', text: 'Post 2', comments_counter:0, likes_counter:0)
     Comment.create(author: @user, post: @post, text: 'I love comments')
  end

  describe 'index' do
    it 'shows the users profile picture' do
        visit "/users/#{@user.id}/posts"
        img = page.find('img')
        expect(img['src']).to have_content('https://unsplash.com/photos/F_-0BxGuVvo')
      end

      it 'shows the users username' do
        visit "/users/#{@user.id}/posts"
        expect(page).to have_content('Yunus')
      end

      it 'shows the users posts counter' do
        visit "/users/#{@user.id}/posts"
        expect(page).to have_content('Number of posts: 4')
      end

      it 'shows the title of a post' do
        visit "/users/#{@user.id}/posts"
        expect(page).to have_content('Post #0')
      end

      it 'shows the body of a post' do
        visit "/users/#{@user.id}/posts"
        expect(page).to have_content('I love posting')
      end

      it 'shows the first comment of a post' do
        visit "/users/#{@user.id}/posts"
        expect(page).to have_content('I love comments')
      end

      it 'shows how many comments a post has' do
        visit "/users/#{@user.id}/posts"
        expect(page).to have_content('Comments 0, Likes 0')
      end

      it 'shows how many likes a post has' do
        visit "/users/#{@user.id}/posts"
        expect(page).to have_content('Comments 0, Likes 0')
      end

      it 'redirects me to the post show page when clicking on a post' do
        visit "/users/#{@user.id}/posts"
        post = page.first('a')
        post.click
        expect(page).to have_current_path("/users/#{@user.id}/posts/#{@post.id}")
      end
  end

  describe 'user page' do
    it 'shows the posts author' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content('Post by Yunus')
    end

    it 'shows the number of comments' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content('Comments 1, Likes 0')
    end

    it 'shows the number of likes' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content('Comments 1, Likes 0')
    end

    it 'shows the post body' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content('I love posting')
    end

    it 'shows the username of each commentator' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content('Yunus: I love comments')
    end

    it 'shows the comment of each commentator' do
      visit "/users/#{@user.id}/posts/#{@post.id}"
      expect(page).to have_content('Yunus: I love comments')
    end
  end
end