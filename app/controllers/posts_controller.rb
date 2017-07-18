class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :create_comment]
  
  def index
    @post = Post.new
    @posts = Post.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post
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
    @comments = @post.comments.reverse
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
  
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
