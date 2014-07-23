class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(params[:user])
    if @user
      sign_in!(@user)
      //redirect somwhere (root?/splash page)
    else
      flash.now[:errors] = ['Invalid password and/or email']
      render :new
  end

  def destroy
    sign_out!
    //redirect somewhere (root?/splash page)
  end
end
