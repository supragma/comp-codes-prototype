class HomeController < ApplicationController
  def index
    redirect_to dashboard_url
  end
end
