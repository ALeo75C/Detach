class Article < ApplicationRecord
  has_many :bookmarks
  has_many :profiles, through: :bookmarks

  mount_uploader :cover, CoverUploader
end
