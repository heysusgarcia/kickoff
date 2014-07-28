class UsersController < ApplicationController
  before_action :restrict_profile_settings, only: [:edit]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in!(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_profile_params)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def user_profile_params
    params.require(:user).permit(:name, :biography, :location,
      :website, :profile_photo
    )
  end

  def restrict_profile_settings
    redirect_to root_url unless (current_user.id == params[:id].to_i)
  end
end
