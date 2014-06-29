class ChildController < ApplicationController
  def create
  end
  
  def store
    @child = Child.new(child_params)
    @child.parent_id = session[:user_id]
    @child.save
    redirect_to '/dashboard'
  end
  
  private
  def child_params
    params.require(:child).permit(:name)
  end
  
end
