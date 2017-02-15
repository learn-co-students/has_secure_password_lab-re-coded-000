class SessionsController < ApplicationController
	def login	
	end
	
	def create
		@user = User.find_by(name: params[:name])
		if @user && @user.try(:authenticate, params[:password]) then
      		session[:user_id] = @user.id
      		render 'users#index'
    	else
    		return flash[:notice] = "check your credentials"
      		redirect_to('/login')
    	end
	end
	
	def destroy
		session.delete :name
		redirect_to '/'
	end
end