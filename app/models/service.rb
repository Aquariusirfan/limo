class Service < ActiveRecord::Base
  belongs_to :company
  has_many :reservations, dependent: :destroy
end
