class ZipCode < ActiveRecord::Base
  belongs_to :company
  belongs_to :company_zone
end
