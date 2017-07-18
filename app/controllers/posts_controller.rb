class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :create_comment]
  
  def index
    @post = Post.new
    @posts = Post.reorder("created_at DESC").paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @new_post = Post.new
  end

  def create
    @new_post = current_user.posts.new(post_params)

    if @new_post.save
      redirect_to @new_post
    else
      render :action => 'new'
    end
  end

  def create_comment
    @post = Post.find(params[:id])

    @comment = @post.comments.new(comment_params)

    if @comment.save
      redirect_to @post
    else
      render :action => 'new'
    end
  end
  
  def show
    if current_user
      @user_id = current_user.id
    end

    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
  
  def post_params
    params.require(:new_post).permit(:title, :body)
  end

end
