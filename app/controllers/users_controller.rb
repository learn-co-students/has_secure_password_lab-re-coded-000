class UsersController < ApplicationController
  def index
     if session[:user_id]
       @user=User.find(session[:user_id])
     else
       redirect_to("/login")

     end
  end

  def new
   @user=User.new
  end
  def create
  #  raise params.inspect
    user=User.new(set_params)
    if user.save
      session[:user_id]=user.id
      redirect_to('/')
    else
         redirect_to("/signup")
    end
  end

  private

  def set_params
    params.require(:user).permit(:name,:password,:password_confirmation)
  end
end
