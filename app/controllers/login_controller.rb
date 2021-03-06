require 'digest'

class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    if session[:current_user_id].nil?
      render 'index'
    else
      redirect_to dashboard_url
    end
  end

  # Create a session.
  def create
    user = get_user
    if user.nil?
      render 'badlogin'
      return
    end
    
    if password_bad?(user)
      render 'badlogin'
      return
    end 
    # Put cookie on user.
    session[:current_user_id] = user.id
    # TODO Redirect them to the dashboard.
    redirect_to controller: 'dashboard'
  end

  def forgotpassword
    render 'forgotpassword'
  end

  private
  def get_user
    user = User.find_by email: params["uname"]
    return user
  end


  def password_bad?(user)
    password_hash = Digest::SHA512.hexdigest params["psw"]
    return password_hash != user.pw
  end
end
