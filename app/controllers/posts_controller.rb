class PostsController < ApplicationController
  def index
    # return all posts for a user
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    # display a specific post
    @post = Post.find(params[:id])
    @comments = @post.comments
    @user = User.find(params[:user_id])
  end
end
