module AuthenticationConcern
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
    helper_method :logged_in?
  end

  def current_user
    return nil if session[:user_id].blank?
    @current_user ||= User.where(id: session[:user_id]).first
  end

  def logged_in?
    !current_user.nil?
  end
end
