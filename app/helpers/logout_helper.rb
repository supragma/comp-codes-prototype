module LogoutHelper
  def is_logged_in?
    user_id = session["current_user_id"]
    current_user = User.find_by_id(user_id)
    if current_user.nil?
      return false
    end
    true
  end
end
