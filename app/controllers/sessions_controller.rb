class SessionsController < ApplicationController
  def login
    # debugger
  end

  def logout
    session[:user] = nil
    flash[:notice] = "Goodbye"
      redirect_to root_url
  end

  def create
    email = params[:email]
    password = params[:password]
    user = User.where("email =? ", email).first
    user_password = BCrypt::Engine.hash_secret(password, user.password_salt) unless user.blank?
    # debugger
    if !user_password.blank? and user.password_hash.eql? user_password
      session[:user] = user.id
      flash[:notice] = "Welcome #{user.email}"
      redirect_to root_url
    else
      flash[:error] = "Your data not valid"
      render "login"
    end
  end

  def edit
    user = User.find_by_activation_token(params[:id])
    debugger
    if user.try(:update,{activation_token: "", activation_status: "active"})
      flash[:notice] = "Your account has active"
      redirect_to root_url
    else
      flash[:notice] = "Welcome to Rails 4"
      redirect_to root_url
    end
  end

end