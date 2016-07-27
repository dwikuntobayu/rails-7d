class Product < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  
  validates :nama, presence: true, length: { minimum: 5, maximum: 15 }
  validates :quantity, numericality: true
  
  has_one :article
  has_many :comments
end
