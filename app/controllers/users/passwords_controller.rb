# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
   def edit
    if current_user
      render :edit
    else
      redirect_to new_user_session_path, alert: 'You need to sign in first.'
    end
   end

  # PUT /resource/password
  def update
    if current_user.update_with_password(password_update_params)
      bypass_sign_in(current_user) # Re-sign in the user to keep them logged in
      redirect_to root_path, notice: 'Your password has been successfully updated.'
    else
      render :edit
    end
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
  private

  # Allow only password and password confirmation for update
  def password_update_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
