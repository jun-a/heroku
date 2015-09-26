class AdminUserLoginsController < ApplicationController

  def new
  end

  def login
    email = params[:admin_user_logins][:email]
    password = params[:admin_user_logins][:password]
    user = AdminUser.find_by(email: email)

    if user.blank?
      redirect_to root_path
      return
    end

    if user.correct_password?(password)
      session[:admin_user_id] = user.id
      redirect_to my_page_home_path
    else
      flash[:error] = 'passwordが一致しません'
      redirect_to login_admin_path
    end

  end

  def logout
    session[:admin_user_id] = nil
    redirect_to root_path
  end
end
