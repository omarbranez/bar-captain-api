class DrinksController < ApplicationController
    def index
        drinks = Drink.all
        render json: drinks
    end
end
