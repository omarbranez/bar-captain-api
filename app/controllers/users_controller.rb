class UsersController < ApplicationController
    def show
        user = User.find(params[:id])
        render json: UserSerializer.new(user)
    end

    def create
        user = User.new(user_params)
        if user.save
            token = encode_token(user.id)
            render json: {user: UserSerializer.new(user), token: token}
        else
            render json: user.errors, status: :unprocessable_entity
        end
    end

    def add
        user = logged_in_user
        product = Product.find(params[:product_id])
        token = encode_token(user.id)
        if user.products.where(id: product.id).exists?
            render json: {user: UserSerializer.new(user), token: token, errors: "Product already exists in inventory"}
        else
            options = { include: [:drinks, :products]}
            ProductsUser.create(user_id: user.id, product_id: product.id)
            render json: {user: UserSerializer.new(user, options), token: token}
        end
    end

    def remove
        user = logged_in_user
        product = Product.find(params[:product_id])
        token = encode_token(user.id)
        if user.products.where(id: product.id).exists?
            @product_to_delete = ProductsUser.find_by(user_id: user.id, product_id: product.id)
            @product_to_delete.destroy
            options = { include: [:drinks, :products]}
            # binding.pry
            # ProductsUser.where(user_id: user.id, product_id: product.id).destroy
            render json: {user: UserSerializer.new(user, options), token: token}
        else
            render json: {user: UserSerializer.new(user), token: token, errors: "Product does not exist in inventory"}
        end
    end

    private
    
    def user_params
        params.permit(:username, :password, :product_id)
    end
end
