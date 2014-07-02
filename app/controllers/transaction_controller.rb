class TransactionController < ApplicationController
  def create
    @child_id = params[:child_id]
    @child = Child.find(@child_id)
    @child_array = child_array
  end
  
  def store
    @transaction = Transaction.new(transaction_params)
    if Child.exists?(id: transaction_params[:child_id], parent_id: session[:user_id]) && @transaction.save
      redirect_to '/dashboard', alert: "Transaction saved"
    else
      @child = Child.find(transaction_params[:child_id])
      @child_array = child_array
      render 'create'
    end
  end
  
  private
    def transaction_params
      params.require(:transaction).permit(:child_id, :action, :description, :amount)
    end
  
    def child_array
      array = Child.where(parent_id: session[:user_id])
      return array.map { |child| [child.name, child.id] }
    end
  
end
