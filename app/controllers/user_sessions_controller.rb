class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:root, notice: 'Login Successful')
    else
      redirect_to(:back, alert: 'Login Failed')
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'Logged Out')
  end
end