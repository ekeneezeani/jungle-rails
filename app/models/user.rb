class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true, length: { minimum: 12 }
  validates :password_confirmation, presence:true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true 
  before_save :downcase_fields

  def downcase_fields
    self.email.downcase
  end

  def self.authenticate_with_credentials(email, password)
    user = User.find_by email: email.strip.downcase
    if user
      if user.authenticate(password)
        user
      else
        nil
      end
    end
  end
end

