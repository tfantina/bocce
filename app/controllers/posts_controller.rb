class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.where(user_id: current_user.id).order(created_at: :desc)

  end
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to current_user
    else
     render 'static_pages/home'
   end
  end



  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
