class DashboardController < ApplicationController
  def index
    @children = Child.where(parent_id: session[:user_id])
  end
end


