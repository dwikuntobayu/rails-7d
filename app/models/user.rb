class User < ActiveRecord::Base

  ## virtual attribute password (dipakai untuk handle form)
  attr_accessor :password
  
  before_save :add_salt_and_hash
  before_create :add_activation_token

  ## Validation section
  validates :email, presence: true, 
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, 
    uniqueness: true

  validates :password,  :on => :create, presence: true, 
    length: {minimum: 8}, 
    confirmation: true


  def add_salt_and_hash
    unless password.blank?
      ## string random yg dipakai untuk generate hash
      self.password_salt = BCrypt::Engine.generate_salt
      ## mirip md5, cuman menggunakan teknik hash
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  
  def add_activation_token
    self.activation_token = SecureRandom.urlsafe_base64
    self.activation_status = "not activated"
  end
  
end
