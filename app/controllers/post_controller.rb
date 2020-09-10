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
    @comments = Comment.where(post_id: @job.id)
    render 'show'
  end

  def images
    # Append images to a post.
    @job = Post.where(id: params["id"], user_id: session[:current_user_id])
    puts @job
    @job[0].files.attach(params["documents"])
    redirect_to '/post/' + params["id"]
  end

  def comments
    # Append a comment to a job.
    @job = Post.where(id: params["id"], user_id: session[:current_user_id])
    Comment.create!(user_id: session[:current_user_id],
                    post_id: @job[0].id,
                    content: params["comment"])
    redirect_to '/post/' + params["id"]
  end
end
