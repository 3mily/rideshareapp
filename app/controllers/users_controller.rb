class UsersController < ApplicationController
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


  # helper method
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :phone, :password, :password_confirmation)
  end
end