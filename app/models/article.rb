class Article < ActiveRecord::Base
  validates :title, length: { minimum: 5 }
  validates :content, length: { minimum: 50 }
end