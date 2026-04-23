class Vet < ApplicationRecord
    has_many :appointments

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :specialization, presence: true

    before_validation :lowercase_email
    def lowercase_email
        self.email = email.lowercase.strip
    end

    scope :by_specialization, ->(specialization) {
        where(specialization: specialization)
    }

end
