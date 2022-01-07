class DrinksController < ApplicationController
    def index
        drinks = Drink.includes(:products).all
        # options = { include: [:user]}
        render json: DrinkSerializer.new(drinks)
    end

    def show
        drink = Drink.find(params[:id])
        # render json: DrinkSerializer.new(drink)
        render json: DrinkShowSerializer.new(drink)
    end

    # def modal
    #     drink = Drink.find(params[:id])
    #     render json: DrinkModalSerializer.new(drink)
    # end
end
