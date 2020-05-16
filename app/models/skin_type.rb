class SkinType < ApplicationRecord
  has_one :profile

  has_many :skin_type_factors
  has_many :active_effects, through: :skin_type_factor
end
