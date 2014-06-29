class ParentController < ApplicationController
  def login
  end
  
  def create
    
  end
  
  def store
    render plain: params[:parent].inspect
  end
end
