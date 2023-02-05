class Appointment < ApplicationRecord
    validates :date, :hour, :reason, presence: true
    validates_presence_of :date, :hour, :reason
    belongs_to :user
end
