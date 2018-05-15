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

  def relationship
      @friend = current_user.friendship.build(friendship_params)
      if  @friend.save
        redirect_to current_user
      else
       render 'static_pages/home'
     end
   end



  private

  def friendship_params
      params.require(:friendship).permit()
  end


end
