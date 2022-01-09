class Drink < ApplicationRecord
    has_many :drinks_users
    has_many :users, through: :drinks_users
    belongs_to :user
    has_many :drinks_products
    has_many :products, through: :drinks_products

    validates_uniqueness_of :name
end
