class Customer < ActiveRecord::Base
  belongs_to :account
  belongs_to :company
  has_many :account_customers
  has_many :accounts , through: :account_customers
end
