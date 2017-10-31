class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @plan = @comment.plan
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.plan_id = params[:plan_id]
    if @comment.save
      redirect_to plans_url
    else
      flash[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
