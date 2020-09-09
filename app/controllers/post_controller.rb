class PostController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :is_logged_in?

  def index
    render 'index'
  end
  def create
    desc = params["description"] 
    name = params["name"] 
    current_user = User.find_by_id(session[:current_user_id])
    Post.create!(name: name, description: desc, user_id: current_user.id)
    redirect_to dashboard_url
  end

  def show
    id = params[:id]
    current_user = User.find_by_id(session[:current_user_id])
    @job = Post.find_by(id: id, user_id: current_user.id)
    render 'show'
  end
end
