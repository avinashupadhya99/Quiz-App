class UsersController < ApplicationController

	before_action :require_user, only: [:editPassword]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		if params[:user][:password]!=params[:user][:conf_password]
			flash[:danger] = "Passwords don't match"
			redirect_to signup_path
		else
			@user = User.new(user_params)
			if @user.save
				session[:user_id] = @user.id
				flash[:success] = "Welcome to the quiz app, #{@user.username}"
				redirect_to user_path(@user)
			else
				render 'new'
			end
		end
	end

	def edit
		@user = User.find(params[:id])
		if current_user!=@user
			flash[:danger]="You can only edit your own account"
			redirect_to root_path
		end
	end

	def update
		@user = User.find(params[:id])
		if current_user!=@user
			flash[:danger]="You can only edit your own account"
			redirect_to root_path
		end
		if params[:password].blank?
			params.delete(:password)
		end
		if @user.update(user_params)
			flash[:success] = "Your account was updated successfully"
			redirect_to quizzes_path
		else
			render 'edit'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def editPassword
	end

	def updatePassword
		user_pwd_change = current_user
		if params[:user][:new_password]!=params[:user][:conf_password]
			flash[:danger] = "Passwords don't match"
			redirect_to editPassword_path
		elsif params[:user][:old_password]==params[:user][:new_password]
			flash[:danger] = "New password cannot be same as old password"
			redirect_to editPassword_path
		elsif user_pwd_change.authenticate(params[:user][:old_password])
			user_pwd_change.password=params[:user][:new_password]
			if user_pwd_change.save
				flash[:success] = "Password was changed successfully"
				redirect_to user_path(user_pwd_change)
			else
				flash[:danger] = "Something went wrong!"
				redirect_to editPassword_path
			end
		else
			flash[:danger] = "Wrong old password"
			redirect_to editPassword_path
		end
	end

	def destroy
		@user = User.find(params[:id])
		if current_user!=@user
			flash[:danger]="You can only delete your own account"
			redirect_to root_path
		end
		@user.destroy
		flash[:danger] = "User and all submissions by user have been deleted"
		redirect_to users_path
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end


end