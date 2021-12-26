class UserSerializer
    include JSONAPI::Serializer
    set_key_transform :camel_lower
    # has_many :drinks_users
    # has_many :drinks, through: :drinks_users
    # has_many :products_users
    # has_many :products, through: :products_users
    attributes :id, :username, :drinks, :products
    
    # def 
end