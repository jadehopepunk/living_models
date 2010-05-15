class UsersController < ApplicationController
  
  def activate
    @user = User.find_using_perishable_token(params[:id], 1.week)

    if @user.nil?
      flash[:warning] = "Invalid activation link. If you have reset your password more than once, make sure that you are using the most recent activation email."
      redirect_to root_path
    else
      if !@user.activated
        activated = @user.activate!
      end
      if @user.has_password?
        if @user.activated
          @user.deliver_activation_confirmation!
          UserSession.create(@user, true)
          flash_message(:notice, "Thanks, your account has been activated and you are now signed in.")
          redirect_to root_url
        else
          flash_message(:notice, "Your account account could not be activated. Please contact support.")
          redirect_to root_url
        end
      else
        redirect_to edit_password_user_url(@user.perishable_token)
      end
    end
  end
  
  def edit_password
    @user = current_user
  end
  
  def update_password
    @user = current_user
    @user.password = params[:user]['password']
    @user.password_confirmation = params[:user]['password_confirmation']
    
    if @user.save && @user.has_password?
      redirect_to root_url
    else
      render :action => 'edit_password'
    end
  end
  
end