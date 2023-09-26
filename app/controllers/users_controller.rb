class UsersController < ApplicationController
  def index
    # return all users
    @users = User.all
  end

  def show
    # display a specific user
    @user = User.find(params[:id])
    @posts = @user.posts
  end
end
