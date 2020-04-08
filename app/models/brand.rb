class Brand < ApplicationRecord
  has_many :products

  mount_uploader :logo, BrandsLogoUploader

  validates :name, uniqueness: true

  has_many :follows
  has_many :profiles, through: :following

end
