class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user
      return head(:forbidden) unless @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      redirect_to("/")
    else
      redirect_to("/signup")
    end
  end
  def destroy
    session[:user_id]=nil
    redirect_to("/login")
  end
end
