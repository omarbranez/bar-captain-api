class Product < ApplicationRecord
    has_many :user_products
    has_many :users, through: :products
    has_many :drink_products
    has_many :drinks, through: :drink_products
end
