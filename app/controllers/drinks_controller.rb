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
        # binding.pry
        drink = Drink.new(:name => params[:name], :drink_type => params[:drink_type], :glass_type => params[:glass_type], :instructions => params[:instructions], :photo_url => params[:photo_url], :user_id => user.id)
        # binding.pry
        if drink.save # should go in model?
        # if drink.new_record?
            # Drink.
            # binding.pry
            # drink.update(drink_type: params[:drink_type], glass_type: params[:glass_type], instructions: params[:instructions], photo_url: params[:photo_url])
            ingredients = params[:ingredients]
            ingredients.each do |ing|
                DrinksProduct.create(drink_id: drink.id, product_id: ing["product"]["id"], quantity: ing["quantity"]) # if drink is created
                #         DrinksProduct.create(drink_id: drink.id, product_id: Product.find(ing.productId), quantity: ing.quantity) # if drink is created
            end
            render json: {drink: DrinkShowSerializer.new(drink), token: token, variant: "success", message: "#{drink.name} successfully created!"}
        else
            existing_drink = Drink.find_by(name: params[:name])
            render json: {drink: DrinkShowSerializer.new(existing_drink), token: token, variant: "error", message: "A drink called #{drink.name} already exists"}
        end
    end

end
