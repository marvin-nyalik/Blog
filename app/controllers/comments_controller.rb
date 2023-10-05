class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    respond_to do |format|
      format.json { render json: @comments }
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html { redirect_to user_post_path(current_user, @post) }
        format.json { render json: { message: 'Comment added' }, status: :created }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
