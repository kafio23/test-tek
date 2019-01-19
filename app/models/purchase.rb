class Purchase < ApplicationRecord
    belongs_to :user

    CATEGORIES= %w(categoria1 categoria2 categoria3)
end
