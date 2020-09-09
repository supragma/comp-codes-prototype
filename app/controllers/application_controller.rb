class ApplicationController < ActionController::Base
  def is_logged_in?
    user_id = session["current_user_id"]
    current_user = User.find_by_id(user_id)
    if current_user.nil?
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end
end
