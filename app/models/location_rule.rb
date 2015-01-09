class LocationRule < ActiveRecord::Base
  belongs_to :company
  belongs_to :rate_group
  def self.only_us_and_canada
    Carmen::Country.all.select{|c| %w{US CA AU}.include?(c.code)}
  end
end
