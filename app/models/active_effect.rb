class ActiveEffect < ApplicationRecord
  has_many :property
  has_many :components, through: :property

  has_many :product_promise
  has_many :products, through: :product_promise

  has_many :skin_type_factors
  has_many :skin_types, through: :skin_type_factor

  validates :name, uniqueness: true
end
