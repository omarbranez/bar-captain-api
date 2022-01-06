class SessionsController < ApplicationController

    def create
      user = User.find_by_username(params[:username])
      if user && user.authenticate(params[:password])
        # render_user_with_token(user)
        token = encode_token(user.id)
        render json: {user: UserSerializer.new(user), token: token, variant: "success", message: "Successfully Logged In As #{user.username}"}
      else
        render json: {errors: "Login Attempt Unsuccessful"}, status: :forbidden
      end
    end
  
    def autologin
      render_user_with_token(logged_in_user)
    end
  
  end