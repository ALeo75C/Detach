class Component < ApplicationRecord
  has_many :property
  has_many :products, through: :structure
  has_many :active_effects, through: :property

  validates :name, uniqueness: true

end
