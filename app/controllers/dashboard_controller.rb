class DashboardController < ApplicationController
  before_action :is_logged_in?
  def index
    @current_user = User.find_by_id(session[:current_user_id])
    @jobs = Post.where(user_id: @current_user.id)
    render 'index'
  end
end
