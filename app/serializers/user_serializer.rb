class UserSerializer
    include JSONAPI::Serializer
    has_many :drinks
    has_many :user_drinks
    attributes :username
end