class DrinkShowSerializer
    include JSONAPI::Serializer
    attributes :id, :name, :drink_type, :glass_type, :instructions, :photo_url
    attribute :ingredients do |drink|
        DrinksProduct.where(drink_id: drink.id).where.not(product_id: nil).map {|dri| {product: dri.product, quantity: dri.quantity}}
    end
end