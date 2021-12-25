class UsersController < ApplicationController
    def show
        user = User.find(params)
        render json: user
    end
end
