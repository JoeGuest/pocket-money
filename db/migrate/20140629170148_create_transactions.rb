class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :child_id
      t.string :action
      t.text :description
      t.decimal :amount, :precision => 10, :scale => 2
      t.timestamps
    end
  end
end
