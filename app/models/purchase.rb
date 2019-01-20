class Purchase < ApplicationRecord
    belongs_to :user
    mount_uploader :image, PictureUploader
    validates :image, presence: true

    CATEGORIES= %w(categoria1 categoria2 categoria3)
end
