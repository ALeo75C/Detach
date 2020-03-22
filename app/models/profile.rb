class Profile < ApplicationRecord
  belongs_to :user

  has_many :favorites
  has_many :products, through: :favorites

  has_many :following
  has_many :brands, through: :following
end
