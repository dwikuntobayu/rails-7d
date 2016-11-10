class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_users)
    if @user.save
      
      begin
          ConfirmationMailer.confirm_email("#{@user.email}", @user.activation_token).deliver
      rescue
          flash[:notice] = "activation instruction fails send to your email"
      end
      
      redirect_to root_url
    else
      render "new"
    end
  end

  private
    def params_users
      params.require(:user).permit(:email, :password, :password_confirmation, :activation_token, :activation_status )
    end

end