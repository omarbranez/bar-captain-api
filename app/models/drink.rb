class Drink < ApplicationRecord
    has_many :user_drinks
    has_many :users, through: :user_drinks
    has_many :drink_products
    has_many :products, through: :drink_products
end
