class Pet < ApplicationRecord
    belongs_to :owner
    has_many :appointments

    validates :name, presence: true
    validates :species, presence: true, inclusion: { in: %w[dog cat rabbit bird reptile other], case_sensitive: false }
    validates :date_of_birth, presence: true
    validate :date_of_birth_cannot_be_in_future
    validates :weight, numericality: { greater_than: 0 }, presence: true
    validates :owner_id, presence: true

    def date_of_birth_cannot_be_in_future
        return if date_of_birth.blank?

        if date_of_birth > Date.today
            errors.add(:date_of_birth, "Cannot be in the future")
        end
    end
    
    before_save :capitalize_name
    def capitalize_name
        self.name = name.capitalize
    end
    
    scope :by_species, ->(species) {
        where(species: species)
    }
end