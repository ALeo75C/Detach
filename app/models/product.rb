class Product < ApplicationRecord
  belongs_to :brand

  has_many :comments
  has_many :profiles, through: :comments

  has_many :structure
  has_many :components, through: :structure

  has_many :product_promise
  has_many :active_effects, through: :product_promise

  has_many :favorites
  has_many :users, through: :favorites

  mount_uploader :image, ProductImagesUploader

  validates :name, uniqueness: true

end
