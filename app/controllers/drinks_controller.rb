class DrinksController < ApplicationController
    def index
        drinks = Drink.all
        # options = { include: [:user]}
        render json: DrinkSerializer.new(drinks)
    end

    def show
        drink = Drink.find(params[:id])
        render json: DrinkSerializer.new(drink)
    end
end
