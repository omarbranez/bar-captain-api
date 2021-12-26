class UserSerializer
    include JSONAPI::Serializer
    # has_many :drinks_users
    has_many :drinks, through: :drinks_users
    # has_many :products_users
    has_many :products, through: :products_users
    attributes :id, :username
end