class Admin::UsersController < ApplicationController

	before_action :require_login, only: [:new, :create]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.admin_registration_id = current_user.id
		if @user.save
			redirect_to admin_dashboard_path
			flash[:success] = 'New student is registered'
		else
			render :new
			flash[:error] = 'Error creating'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to admin_user_path(@user)
			flash[:success] = 'User is updated!'
		else
			render :edit
			flash[:error] = 'Error saving'
		end
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def dashboard
	end

	def details
		@user = current_user
	end

	def update_details
		@user = current_user
		if @user.update(user_params)
			redirect_to admin_dashboard_path
			flash[:success] = 'Admin details are updated'
		else
			render :details
			flash[:error] = 'Error saving'
		end
	end

	private

  def user_params
    params.require(:user).permit(:name, :student_id, :email, :password, :designation, :password_confirmation, :identity_number, :contact_number, :course, :course_intake, :emergency_contact, :emergency_number)
  end
end