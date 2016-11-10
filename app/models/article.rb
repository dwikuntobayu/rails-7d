class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_combine, use: :slugged
  
  validates :title, length: { minimum: 5 }
  validates :content, length: { minimum: 10 }

  belongs_to :product
  
  def slug_combine
    [
      [:title, :content]
    ]
  end
end