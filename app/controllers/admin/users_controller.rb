class Admin::UsersController < ApplicationController

	before_action :require_login, only: [:new, :create]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to admin_dashboard_path
			flash[:success] = 'New student is registered'
		else
			render :new
		end
	end

	def index
		@users = User.all
	end

	def dashboard
		
	end

	private

  def user_params
    params.require(:user).permit(:name, :student_id, :email, :password, :password_confirmation)
  end
end