class Transaction < ActiveRecord::Base
  validates :child_id, presence: true
  validates :action, presence: true
  validates :description, presence: true
  validates :amount, presence: true, numericality: true
end
