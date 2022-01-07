class DrinksController < ApplicationController
    def index
        drinks = Drink.includes(:products).all.order('name ASC')
        render json: DrinkSerializer.new(drinks)
    end

    def show
        drink = Drink.find(params[:id])
        render json: DrinkShowSerializer.new(drink)
    end

    def create
        user = logged_in_user
        token = encode_token(user.id)
        drink = Drink.find_or_create_by(name: params[:name])
        if drink.previously_new_record? # should go in model?
            ingredients = params[:ingredients]
            ingredients.each do |ing|
                DrinksProduct.create(drink_id: drink.id, product_id: Product.find(ing.productId), quantity: ing.quantity) # if drink is created
            end
            render json: {drink: DrinkShowSerializer.new(drink), token: token, variant: "success", message: "#{drink.name} successfully created!"}
        else
            render json: {drink: DrinkShowSerializer.new(drink), token: token, varient: "error", message: "A drink called #{drink.name} already exists"}
        end

    end

    # def modal
    #     drink = Drink.find(params[:id])
    #     render json: DrinkModalSerializer.new(drink)
    # end
end
