class ProfileController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :is_logged_in?

  def show
    @current_user = User.find_by_id(session[:current_user_id])
    @profile = Profile.find_by_id(params[:id])
    @references = Reference.where(profile_id: @profile.id)
  end

  def edit
    @current_user = User.find_by_id(session[:current_user_id])
    if @current_user.role != "contractor"
      redirect_to "/dashboard"
      return
    end
    @profile = Profile.find_by_id(params[:id])
  end

  def update
    @current_user = User.find_by_id(session[:current_user_id])
    if @current_user.role != "contractor"
      redirect_to "/dashboard"
      return
    end
    @profile = Profile.find_by_id(params[:id])
    @profile.update(id: params[:id], name: params[:name], description: params[:description], website: params[:website], address: params[:address])
    @profile = Profile.find_by_id(params[:id])
    flash[:info] = "Profile has been updated/created!"
    redirect_to "/profile/#{@profile.id}"
  end

  def reference
    user = User.find_by_id(session[:current_user_id])
    Reference.create!(profile_id: params[:id], user_id: user.id, content: params["content"])
    flash["info"] = "You posted a reference!"
    redirect_to "/profile/#{params[:id]}"
  end
end
