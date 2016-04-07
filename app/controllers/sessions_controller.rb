class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    session[:user_id] = params[:user][:id]
    @user = User.find(session[:user_id])
    redirect_to user_path(@user)
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def session_params
    params.require(:session).permit(:user_id)
  end
end
