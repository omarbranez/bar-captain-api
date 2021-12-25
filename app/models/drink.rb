class Drink < ApplicationRecord
    has_many :user_drinks
    has_many :users, through: :user_drinks
    belongs_to :user
    has_many :drinks_products
    has_many :products, through: :drinks_products
end
