class ChildController < ApplicationController
  def create
  end
  
  def store
    @child = Child.new(child_params)
    @child.parent_id = session[:user_id]
    if @child.save
      redirect_to '/dashboard', alert: "Child added"
    else
      render 'create'
    end
  end
  
  def summary
    @child_id = params[:id]
    @child = Child.find(@child_id)
    @transactions = Transaction.where(child_id: @child_id)
  end
  
  private
  def child_params
    params.require(:child).permit(:name)
  end
  
end

