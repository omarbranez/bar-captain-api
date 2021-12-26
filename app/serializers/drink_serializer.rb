class DrinkSerializer
  include JSONAPI::Serializer
  belongs_to :user
  has_many :products
  attributes :id, :name, :drink_type, :glass_type, :instructions, :photo_url
end
