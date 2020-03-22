class Property < ApplicationRecord
  belongs_to :component
  belongs_to :active_effect
end
