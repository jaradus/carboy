class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to dashboard_path(current_user)
    end
  end

  def dashboard

  end

end