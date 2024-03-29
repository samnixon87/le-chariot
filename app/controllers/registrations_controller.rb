class RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    params.require(:user).permit(:name, :username, :email, :image, :batch, :first_name, :last_name, :nickname, :description, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :username, :email, :image, :batch, :first_name, :last_name, :nickname, :description, :password, :password_confirmation, :current_password)
  end
end
