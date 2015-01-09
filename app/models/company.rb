class Company < ActiveRecord::Base
  
  before_create :add_domain_to_company
  
  after_create :create_rate_group
  
  validates_uniqueness_of :name
  
  has_many :users
  has_one :reservation_setting , dependent: :destroy
  has_many :vehicle_types, dependent: :destroy
  has_many :distance_estimation_settings, dependent: :destroy
  has_many :hourly_estimation_settings, dependent: :destroy
  has_many :vehicle_type
  has_many :services
  has_many :places
  has_many :company_zones, dependent: :destroy
  has_many :zip_codes, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :vehicle_type, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :rate_groups, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :customers, dependent: :destroy
  

  accepts_nested_attributes_for :reservation_setting
  
  def add_domain_to_company
    self.company_domain = self.name.downcase!
  end
  #this is temp method
  def create_rate_group
    RateGroup.create(name: "Regular",company_id: self.id) 
    RateGroup.create(name: "Iterative",company_id: self.id) 
  end
end
