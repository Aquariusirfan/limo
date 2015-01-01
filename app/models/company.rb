class Company < ActiveRecord::Base
  before_create :add_domain_to_company
  validates_uniqueness_of :name
  belongs_to :user
  def add_domain_to_company
    self.company_domain = self.name
  end
end
