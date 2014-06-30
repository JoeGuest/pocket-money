class TransactionController < ApplicationController
  def store
    @transaction = Transaction.new(transaction_params)
    @transaction.save
    redirect_to '/dashboard'
  end
  
  private
    def transaction_params
      params.require(:transaction).permit(:child_id, :action, :description, :amount)
    end
end
