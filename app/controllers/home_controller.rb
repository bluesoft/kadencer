class HomeController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    if current_user.organizations.size == 0
      redirect_to "/organizations/new"
    end
  end
  
end
