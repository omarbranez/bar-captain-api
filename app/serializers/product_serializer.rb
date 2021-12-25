class ProductSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  attributes :id, :name, :category, :subcategory, :description
end
