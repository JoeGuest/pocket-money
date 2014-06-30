class Child < ActiveRecord::Base
  
  def balance
    transactions = Transaction.where(child_id: self.id)
    total = 0
    transactions.each do |transaction|
      if transaction.action == 'Add'
        total += transaction.amount
      else
        total -= transaction.amount
      end
    end
    return total
  end

end