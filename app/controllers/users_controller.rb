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

    private
    
    def user_params
        params.permit(:username, :password)
    end
end
