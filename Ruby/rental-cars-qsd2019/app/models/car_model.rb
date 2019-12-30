class CarModel < ApplicationRecord
  belongs_to :Manufacturer
  belongs_to :CarCategory
end
