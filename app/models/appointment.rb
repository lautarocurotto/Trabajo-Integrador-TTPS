class Appointment < ApplicationRecord
    validates :date, :hour, :reason, presence: true
    belongs_to :user
end
