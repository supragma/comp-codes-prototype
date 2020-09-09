require 'digest'
class DraftersignupController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render 'index'
  end

  def create
    if params["psw"] != params["psw-repeat"]
      render 'passwordmismatch' 
    end
    password_hash = Digest::SHA512.hexdigest params["psw"]
    User.create!(email: params["email"], pw: password_hash, first_name: params["fname"], last_name: params["lname"], role: "drafter")

    render 'success'
  end
end
