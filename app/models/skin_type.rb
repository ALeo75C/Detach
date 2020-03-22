class SkinType < ApplicationRecord
  has_many :personal_factors
  has_many :user, through: :personal_factors
end
