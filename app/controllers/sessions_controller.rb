class SessionsController < ApplicationController
	def login	
	end
	
	def create
    	@user = User.find_by(name: params[:name]) #passing with including user
    	if @user
      	return head(:forbidden) unless @user.try(:authenticate, params[:password])
      	session[:user_id] = @user.id
      	render 'users/index'
    	else
      	redirect_to("/login")
      	end
	end
	
	def destroy
		session.delete :name
		redirect_to '/'
	end
end