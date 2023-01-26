class Location < ApplicationRecord
    has_many :branches
    before_save :uppercase_fields
    validates :name, :province, presence: true
    validates :name, uniqueness: {scope: :province, message: "Ya existe una ciudad con ese nombre en dicha provincia"}
    def uppercase_fields
        self.name.upcase!
        self.province.upcase!
    end
    def fullname
        aux = self.name + ' ' + self.province
    end
end
