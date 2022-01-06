class User < ApplicationRecord
    has_secure_password
    validates_presence_of :username
    validates_presence_of :password

    has_many :drinks_users
    has_many :drinks, through: :drinks_users
    has_many :products_users
    has_many :products, through: :products_users

    def self.possible_drinks
        user = User.find(ProductsUser.last.user_id)
        Drink.all.select{|drink|(drink.products.ids - user.product_ids).empty?}.each do |drink|
            DrinksUser.find_or_create_by(user_id: user.id, drink_id: drink.id)
        end
    end
end
