class DrinkShowSerializer
    include JSONAPI::Serializer
    attributes :id, :name, :drink_type, :glass_type, :instructions, :photo_url
    attributes :ingredients do |drink|

        hash = {}
        
        DrinksProduct.where(drink_id: drink.id).each do |dri|
            hash[:product] = Product.includes(:drinks_products).find(DrinksProduct.where(drink_id: drink.id).first.product_id)
            hash[:quantity] = dri.quantity
        end
        # binding.pry
         hash
      end
end