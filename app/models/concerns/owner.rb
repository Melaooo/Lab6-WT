class Owner < ApplicationRecord
  has_many :pets
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true

  before_validation :lowercase_email
  
  def lowercase_email
    self.email = email.strip.downcase if email.present?
  end

end