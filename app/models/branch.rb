class Branch < ApplicationRecord
    belongs_to :location
    has_one :schedule
    accepts_nested_attributes_for :schedule
    validates :name, :address, :phone, :location, presence: true
    validates :name, uniqueness: true

    attr_accessor :monday_start, :monday_end, :tuesday_start, :tuesday_end, :wednesday_start, :wednesday_end, :thursday_start, :thursday_end, :friday_start, :friday_end, :saturday_start, :saturday_end, :sunday_start, :sunday_end

end
