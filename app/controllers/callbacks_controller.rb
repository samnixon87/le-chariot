class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.first_name = @user.name.split.first
    @user.last_name = @user.name.split.last
    @user.nickname = @user.username
    @user.save
    sign_in_and_redirect @user
  end
end
