class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:session][:email], params[:session][:password])
      redirect_to root_path
      flash[:notice] = 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
