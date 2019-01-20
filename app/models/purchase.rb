class Purchase < ApplicationRecord
    belongs_to :user
    mount_uploader :image, PictureUploader

    CATEGORIES= %w(categoria1 categoria2 categoria3)
end
