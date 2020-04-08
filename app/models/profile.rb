class Profile < ApplicationRecord
  belongs_to :user

  has_many :favorites
  has_many :products, through: :favorites

  has_many :follows
  has_many :brands, through: :following

  belongs_to :skin_type, optional: true

  mount_uploader :avatar, AvatarUploader
end
