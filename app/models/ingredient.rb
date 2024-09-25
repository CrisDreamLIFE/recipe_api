class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :material
  belongs_to :measurement_unit
end
