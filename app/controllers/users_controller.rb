class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id).order(created_at: :desc)
    @post = Post.new
  end

  def search
    @users = User.where(["name LIKE ?", "%#{params[:search]}%"])
  end


end
