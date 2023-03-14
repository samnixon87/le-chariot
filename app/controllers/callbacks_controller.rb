class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    @user.first_name = @user.name.split.first
    @user.last_name = @user.name.split.last
    @user.nickname = request.env["omniauth.auth"].extra.raw_info.login
    @user.image = request.env["omniauth.auth"].info.image
    @user.description = request.env["omniauth.auth"].extra.raw_info.bio
    @user.save
    sign_in_and_redirect @user
  end
end
