class DrinkSerializer
  include JSONAPI::Serializer
  belongs_to :user
  attributes :id, :name, :drink_type, :glass_type, :instructions, :photo_url
  attribute :products do |drink|
    drink.products
  end
end
