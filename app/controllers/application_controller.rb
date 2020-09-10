class ApplicationController < ActionController::Base
  #helper_method :is_logged_in?
  def is_logged_in?
    user_id = session["current_user_id"]
    current_user = User.find_by_id(user_id)
    if current_user.nil?
      redirect_to login_url
      return false
    end
    true
  end
end
