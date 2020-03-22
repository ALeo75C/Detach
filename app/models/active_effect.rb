class ActiveEffect < ApplicationRecord
  has_many :property
  has_many :product_promise
  has_many :components, through: :property
  has_many :products, through: :product_promise

  validates :name, uniqueness: true
end
