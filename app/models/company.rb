class Company < ActiveRecord::Base
  before_create :add_domain_to_company
  validates_uniqueness_of :name
  belongs_to :user
  has_one :reservation_setting
  has_many :vehicle_type
  has_many :services
  has_many :places

  accepts_nested_attributes_for :reservation_setting
  def add_domain_to_company
    self.company_domain = self.name.downcase!
  end

end
