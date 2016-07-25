class SessionsController < ApplicationController
  def new
  end

  def create

    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # 登入用户,然后重定向到用户的资料页面
    else
      flash.now[:danger] = 'Invalid email/password combination' # 不完全正确
      render 'new'
    end
  end

  def destroy

  end
end
