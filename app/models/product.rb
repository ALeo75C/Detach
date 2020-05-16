class Product < ApplicationRecord
  belongs_to :brand

  has_many :comments
  # has_many :profiles, through: :comments

  has_many :structure
  has_many :components, through: :structure

  has_many :product_promise
  has_many :active_effects, through: :product_promise

  has_many :favorites
  has_many :users, through: :favorites

  has_many :product_types
  has_many :products_groups, through: :product_types

  mount_uploader :image, ProductImagesUploader

  validates :name, uniqueness: true

end
