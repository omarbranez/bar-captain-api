class SessionsController < ApplicationController

    def create
      user = User.find_by_username(params[:username])
      if user && user.authenticate(params[:password])
        render_user_with_token(user)
      else
        render json: {errors: "Login Attempt Unsuccessful"}, status: :forbidden
      end
    end
  
    def autologin
      render_user_with_token(logged_in_user)
    end
  
  end