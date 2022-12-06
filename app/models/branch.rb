class Branch < ApplicationRecord
    belongs_to :location
    has_one :schedule
    accepts_nested_attributes_for :schedule
end
