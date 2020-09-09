require 'digest'

class LoginController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    render 'index'
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
    # TODO Put cookie on user.
    # TODO Redirect them to the dashboard.

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
