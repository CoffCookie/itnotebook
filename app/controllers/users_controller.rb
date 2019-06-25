class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.find_by(id: 1)
  end

  def login
    #送信されたユーザデータをチェックする
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect_to("/posts/admin")
    else
      redirect_to("/")
    end
  end
  def logout
    session[:user_id] = nil
    flash[:notic] = "ログアウトしました"
    redirect_to("/")
  end
end
