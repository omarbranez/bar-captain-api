class DrinksProduct < ApplicationRecord
    belongs_to :drink
    belongs_to :product
end