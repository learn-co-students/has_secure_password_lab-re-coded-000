class UsersController < ApplicationController
  def new
  end

  def create
   if !@user = User.new(user_params).save
     return redirect_to controller: 'users', action: 'new'
   end
   if  @user = User.create(user_params)
   session[:user_id] = @user.id
   redirect_to controller: 'application', action: 'home'
 end
 end
 
 private
 
 def user_params
  params.require(:user).permit(:name, :password, :password_confirmation)
end
end
