class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :user_signed_in?

  def authenticate
    redirect_to login_url unless session[:user_id]
  end

  private
    def current_user
      begin
        @current_user ||= session[:user_id]
      rescue Exception => e
        nil
      end
    end

    def user_signed_in?
      return true if current_user
    end

end
