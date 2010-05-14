class PasswordResetRequestsController < ApplicationController

  before_filter :require_no_user

  def create  
    @user = User.find_by_email(params[:email])  
    if @user  
      @user.reset_perishable_token!
      UserMailer.deliver_password_reset_instructions(@user)
      flash[:notice] = 'Please check your email to get further information on resetting your password'
      redirect_to root_url  
    else  
      flash[:notice] = 'Sorry, there is no user with that email address' 
      render :new  
    end  
  end  
  
  def edit  
    @user = User.find_by_perishable_token(params[:id])  
  end 
  
  def update
    @user = User.find_by_perishable_token(params[:id]) 
    
    unless params[:user][:password].blank?      
      @user.password              = params[:user][:password]
      @user.password_confirmation = params[:user][:password_confirmation]
      
      if @user.save
        flash[:notice] = 'Your password has been updated. Your are logged in.'
        redirect_to account_url
      else             
        render :edit
      end
    else
      flash[:error] = 'Please enter your new password!'
      render :edit
    end
  end
    
end


