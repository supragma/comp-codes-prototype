require 'digest'
class SignupController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render 'index'
  end

  def create
    if params["psw"] != params["psw-repeat"]
      render 'passwordmismatch' 
      return
    end
    password_hash = Digest::SHA512.hexdigest params["psw"]
    user = User.create!(email: params["email"], pw: password_hash, first_name: params["fname"], last_name: params["lname"], role: "homeowner")
    session[:current_user_id] = user.id
    redirect_to dashboard_url
  end
end
