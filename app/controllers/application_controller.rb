class ApplicationController < ActionController::API

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  
  
    def encode_token(user_id)
      JWT.encode({user_id: user_id}, ENV["JWT_SECRET"])
    end
  
    def logged_in_user
      User.find(decoded_token["user_id"])
    end
  
    def render_unprocessable_entity(invalid)
      render json: {errors: invalid.record.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  
    def render_user_with_token(user)
        # binding.pry
      render json: {user: UserSerializer.new(user), token: encode_token(user.id)}
    end
  
  
    private
  
    def get_token
      request.headers["Authorization"]
    end
  
    def decoded_token
      JWT.decode(get_token, ENV["JWT_SECRET"])[0]
    end
  
end
