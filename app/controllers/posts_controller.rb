class PostsController < ApplicationController
  def index
  @user = User.find(params[:user_id])
  @posts = Post.all.where(author_id: @user.id)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
end
