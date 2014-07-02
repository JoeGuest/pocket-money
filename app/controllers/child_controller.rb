class ChildController < ApplicationController
  include ActionView::Helpers::NumberHelper
  
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
  
  def balance
    @child = Child.find_by(id: params[:id], parent_id: session[:user_id])
    if @child
      balance = number_to_currency(@child.balance, unit: '£')
      render json: balance.to_json
    else
      render plain: '', status: :forbidden
    end
  end
  
  private
  def child_params
    params.require(:child).permit(:name)
  end
  
end

