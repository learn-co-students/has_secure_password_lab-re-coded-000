class UsersController < ApplicationController
	
	def index
		 if session[:user_id]
       		@user=User.find(session[:user_id])
     	else
       		redirect_to("/login")
     	end
	end

	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			session[:id] = @user.id
			render :index
		else
			flash[:notice] = "failed to sign up"
			redirect_to '/signup'
		end
	end
		private
	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end
end