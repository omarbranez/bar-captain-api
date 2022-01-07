class DrinkSerializer
  include JSONAPI::Serializer
  # belongs_to :user
  attributes :id, :name, :drink_type, :glass_type, :instructions, :photo_url
  attribute :products do |drink|
    drink.products
  end
  # attribute :ingredients do |drink|

  #   hash = {}
    
  #   DrinksProduct.where(drink_id: drink.id).each do |dri|
  #       hash[:product] = Product.includes(:drinks_products).find(DrinksProduct.where(drink_id: drink.id).first.product_id)
  #       hash[:quantity] = dri.quantity
  #   end
  #   # binding.pry
  #    hash
  # end
end
