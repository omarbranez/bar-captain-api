class Product < ApplicationRecord
    has_many :products_users
    has_many :users, through: :products_users
    has_many :drinks_products
    has_many :drinks, through: :drinks_products
end
