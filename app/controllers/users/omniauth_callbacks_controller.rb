module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
      def google_oauth2
          @user = User.from_omniauth(request.env["omniauth.auth"])

          if @user.persisted?
            sign_in_and_redirect @user, event: :authentication
            flash[:notice] = "会員ページにログインしました"
          #   set_flash_message!(:notice, :success, kind: "Google") if is_navigational_format?
          else
            session["devise.google_data"] = request.env["omniauth.auth"].except(:extra)
            redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
          end
      end
      
      def failure
          redirect_to root_path
      end
      
      protected

      def after_sign_in_path_for(resource)
        members_path
      end
  end
end

