class VehicleType < ActiveRecord::Base
  belongs_to :company
  #  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  has_many :distance_estimation_settings, dependent: :destroy
  has_many :hourly_estimation_settings, dependent: :destroy
  has_many :zone_rates, dependent: :destroy

  has_attached_file :image,  :storage => 's3',
    :s3_credentials => {:access_key_id => "AKIAIETPPQ55S3QZGFQA" ,:secret_access_key => "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"},
    :bucket => "rentareto",
    :path => "/system/ugc/:class/:id/:style/:basename.:extension",
    :styles => {:large => "1400x525>" }, :convert_options => {
    :all => "-strip",
    :negative => "-negate"
  },
    :default_style => :original
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
