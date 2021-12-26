class Product < ApplicationRecord
    has_many :products_users
    has_many :users, through: :products_users
    has_many :drink_products
    has_many :drinks, through: :drink_products
end
