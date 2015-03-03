class UsersController < ApplicationController

  def index
    @user = current_user
    @reviews = Review.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.phone = "+"+params["phone1"]+params["phone2"]+params["phone3"]

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome aboard, #{@user.firstname}! Now, add some places!"
      redirect_to places_path
    else
      render :new
    end
  end

  def show
    @user = User.where(id: params[:user_id])
    @reviews = Review.all
    @review = Review.new
  end

  # helper method
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end
end
