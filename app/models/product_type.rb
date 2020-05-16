class ProductType < ApplicationRecord
  belongs_to :product
  belongs_to :product_group
end
