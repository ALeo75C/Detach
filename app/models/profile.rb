class Profile < ApplicationRecord
  belongs_to :user

  has_many :comments
  # has_many :products, through: :comments

  has_many :favorites
  has_many :products, through: :favorites

  has_many :follows
  has_many :brands, through: :following

  has_many :bookmarks
  has_many :articles, through: :bookmarks

  belongs_to :skin_type, optional: true

  mount_uploader :avatar, AvatarUploader
end
