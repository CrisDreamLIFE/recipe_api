class Recipe < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :tags
  has_and_belongs_to_many :categories

  has_many :ingredients, dependent: :destroy
end
