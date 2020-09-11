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
    @current_user = User.find_by_id(session[:current_user_id])
    if @current_user.role == "drafter"
      @job = Post.find_by(id: id)
    else
      # Is homeowner so restrict what they can see.
      @job = Post.find_by(id: id, user_id: @current_user.id)
    end
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
    user = User.find_by(id: session[:current_user_id])
    if user.role == "drafter" 
      @job = Post.where(id: params["id"])
    else
      @job = Post.where(id: params["id"], user_id: session[:current_user_id])
    end
    comment = Comment.create!(user_id: session[:current_user_id],
                              post_id: @job[0].id,
                              content: params["comment"])
    # Loop through everyone who has commented and send them all emails
    # Except to the current user.
    users_who_got_mail = []
    comments = Comment.where(post_id: @job[0].id)
    comments.each do |c|
      new_comment_user = User.find_by(id: c.user_id)
      if session[:current_user_id] == c.user_id
        # Do nothing 
      # Eliminate duplicate emails.
      elsif users_who_got_mail.include? new_comment_user.id
        # Do nothing 
      else
        NewCommentMailer.new_comment(@job[0], comment, new_comment_user).deliver
        users_who_got_mail.append(new_comment_user.id)
      end
    end
    redirect_to '/post/' + params["id"]
  end
end
