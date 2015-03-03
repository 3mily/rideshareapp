class UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @reviews = Review.where(reviewee_id: current_user.id)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome aboard, #{@user.firstname}! Now, add some places!"
      redirect_to places_path
    else
      render :new
    end
  end

  def show
    @user = User.where(id: params[:id]).first
    @users = User.all
    @review = Review.new
    @reviews = Review.where(reviewee_id: params[:id])
  end

  # helper method
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :phone, :password, :password_confirmation, :image)
  end
end
