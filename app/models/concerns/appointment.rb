class Appointment < ApplicationRecord
    enum :status, { Scheduled: 0, Completed: 1, Cancelled: 2, In_Progress: 3 }
    belongs_to :pet
    belongs_to :vet
    has_many :treatments
end