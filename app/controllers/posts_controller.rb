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

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.commentsCounter = 0
    @post.likesCounter = 0

    if @post.save
      redirect_to user_post_path(current_user, @post)
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
