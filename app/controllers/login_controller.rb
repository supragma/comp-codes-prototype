require 'bcrypt'

class LoginController < ApplicationController
  include BCrypt
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
    user = User.find_by email: params["email"]
    return user
  end


  def password_bad?(user)
    password_hash = Password.create(params["password"])
    return password_hash != user.password_digest
  end
end
