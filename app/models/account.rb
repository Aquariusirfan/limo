class Account < ActiveRecord::Base
  belongs_to :company
  has_one :rate_group
  has_many :account_customers
  has_many :customers , through: :account_customers
end
