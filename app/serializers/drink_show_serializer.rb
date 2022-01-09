class DrinkShowSerializer
    include JSONAPI::Serializer
    set_key_transform :camel_lower
    attributes :id, :name, :drink_type, :glass_type, :instructions, :photo_url
    attribute :ingredients do |drink|
        DrinksProduct.where(drink_id: drink.id).where.not(product_id: nil).order('id ASC').map {|dri| {product: dri.product, quantity: dri.quantity}}
    end
end