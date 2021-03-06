class UsersController < ApplicationController
  
  before_filter :require_no_user
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'Thanks for signing up. We just sent you a confirmation email!'
      redirect_back_or_default root_url
    else
      render :new
    end
  end
  
  def confirm
    @user = User.pending.find_using_perishable_token(params[:confirmation_code])
    unless @user
      flash[:error] = 'Sorry, your activation code is invalid!'      
    else                                        
      @user.confirm!
      @user.reset_perishable_token!
      flash[:notice] = 'Great, your registration has been confirmed successfully!'      
    end                                  
    redirect_back_or_default root_url
  end    
end
