class ProductSerializer
  include JSONAPI::Serializer
  attributes :name, :category, :subcategory, :description
end
