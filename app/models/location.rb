class Location < ApplicationRecord
    has_many :branches
    before_save :uppercase_fields

    def uppercase_fields
        self.name.upcase!
        self.province.upcase!
    end
end
