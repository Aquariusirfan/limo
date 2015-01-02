class Company < ActiveRecord::Base
  before_create :add_domain_to_company
  validates_uniqueness_of :name
  belongs_to :user
  has_one :reservation_setting , dependent: :destroy
  has_many :vehicle_types, dependent: :destroy
  has_many :distance_estimation_settings, dependent: :destroy
  has_many :hourly_estimation_settings, dependent: :destroy
  accepts_nested_attributes_for :reservation_setting
  def add_domain_to_company
    self.company_domain = self.name.downcase!
  end
end
