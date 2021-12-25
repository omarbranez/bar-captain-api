class DrinkSerializer
  include JSONAPI::Serializer
  # has_many :user_drinks
  belongs_to :user
  attributes :name, :drink_type, :glass_type, :instructions, :photo_url
end
