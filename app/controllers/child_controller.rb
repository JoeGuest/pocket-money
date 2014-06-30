class ChildController < ApplicationController
  def create
  end
  
  def store
    @child = Child.new(child_params)
    @child.parent_id = session[:user_id]
    @child.save
    redirect_to '/dashboard'
  end
  
  def transaction
    @child_id = params[:id]
    @child_array = Child.where(parent_id: session[:user_id])
    @child_array = @child_array.map { |child| [child.name, child.id] }
  end
  
  def summary
    @child_id = params[:id]
    @transactions = Transaction.where(child_id: @child_id)
  end
  
  private
  def child_params
    params.require(:child).permit(:name)
  end
  
end
