class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_id = params[:sub_id]
    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end

  end

  def edit

  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy

  end

  def update

  end

  def post_params
    params.require(:post).permit(:title,:url,:content)
  end

end
