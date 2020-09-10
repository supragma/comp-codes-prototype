class DashboardController < ApplicationController
  before_action :is_logged_in?
  def index
    @current_user = User.find_by_id(session[:current_user_id])
    if @current_user.role == "homeowner"
      @jobs = Post.where(user_id: @current_user.id)
    elsif @current_user.role == "drafter"
      @jobs = Post.all
    else
      redirect_to '/login'
    end
    render 'index'
  end
end
