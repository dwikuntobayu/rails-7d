class Product < ActiveRecord::Base
  
  validates :nama, presence: true, length: { minimum: 5, maximum: 15 }
  validates :quantity, numericality: true
  
end
