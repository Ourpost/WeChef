# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_before_action :verify_authenticity_token, only: [:google_oauth2]

  skip_before_action :verify_authenticity_token, only: [:google_oauth2]

  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "google") if is_navigational_format?
    else
      session["devise.google_oauth2"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to  user_session_path ,alert: "此信箱已申請過,請確認信箱資訊！！"
    end

    def failure
      redirect_to root_path, alert: '無法獲得驗證！'
    end
  end
end
