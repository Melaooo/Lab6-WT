class Appointment < ApplicationRecord
    enum :status, { Scheduled: 0, Completed: 1, Cancelled: 2, In_Progress: 3 }
    belongs_to :pet
    belongs_to :vet
    has_many :treatments

    validates :date, presence: true
    validates :reason, presence: true
    validates :pet, presence: true
    validates :vet, presence: true
    validates :status, presence: true

    scope :upcoming, -> {
        where("date > ?", Time.current).order(date: :asc)
    }

    scope :past, -> {
        where("date < ?", Time.current).order(date: :desc)
    }

end