class AccountCustomer < ActiveRecord::Base
  belongs_to :account
  belongs_to :customer
end
