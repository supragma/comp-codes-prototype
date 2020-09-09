class SignupController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render 'index'
  end

  def create
    if params["psw"] != params["psw-repeat"]
      render 'passwordmismatch' 
    end
    User.create(email: params["email"], password: params["pwd"], first_name: params["fname"], last_name: params["lname"])

    render 'success'
  end
end
