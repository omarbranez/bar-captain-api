class ProductsUser < ApplicationRecord
    belongs_to :user
    belongs_to :product

    after_create :update_drinks_user

    def possible_drinks
        user = User.find(ProductsUser.last.user_id)
        Drink.all.select{|drink|(drink.products.ids - user.product_ids).empty?}
    end

    def update_drinks_user
        user = User.find(ProductsUser.last.user_id)
        possible_drinks.each do |drink|
            DrinksUser.find_or_create_by(user_id: user.id, drink_id: drink.id)
        end
    end
end