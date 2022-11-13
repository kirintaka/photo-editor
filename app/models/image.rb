class Image < ApplicationRecord
  mount_uploader :image, PhotoUploader
end
