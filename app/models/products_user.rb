class ProductsUser < ApplicationRecord
    belongs_to :user
    belongs_to :product

    after_create :update_drinks_user
    # after_destroy :recheck_drinks_user

    def possible_drinks
        user = User.find(ProductsUser.last.user_id)
        Drink.all.select{|drink|(drink.products.ids - user.product_ids).empty?}
    end

    def update_drinks_user
        user = User.find(ProductsUser.last.user_id)
        Drink.all.select{|drink|(drink.products.ids - user.product_ids).empty?}.each do |drink|
            DrinksUser.find_or_create_by(user_id: user.id, drink_id: drink.id)
        end
    end

    def self.recheck_drinks(user)
        user.drink_ids - Drink.all.select{|drink|(drink.products.ids - user.product_ids).empty?}.pluck(:id)
    end

    def self.recheck_drinks_user(user)
            self.recheck_drinks(user).each do |drink|
                DrinksUser.find_by(user_id: user.id, drink_id: drink).destroy
            end
        # end
    end
end

# Drink.all.select{|drink|(drink.products.ids - user.product_ids).length == 1} # one ingredient off