class Article < ApplicationRecord
  mount_uploader :cover, CoverUploader
end
