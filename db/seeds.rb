# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

agent_1 = Mechanize.new
drink_page = agent_1.get("https://www.thecocktaildb.com/api/json/v2/#{ENV["API_KEY"]}/filter.php?a=Alcoholic")
drink_data = JSON.parse(drink_page.body)
drink_data.first[1].each do |drink|
    drink_hash = {}
    drink_hash[:user_id] = 1
    drink_hash[:name] = drink["strDrink"]
    drink_hash[:photo_url] = drink["strDrinkThumb"]
    agent_2 = Mechanize.new
    drink_detail_page = agent_2.get("https://www.thecocktaildb.com/api/json/v2/#{ENV["API_KEY"]}/lookup.php?i=#{drink["idDrink"]}")
    drink_detail = JSON.parse(drink_detail_page.body)
    drink_detail.first[1].each do |d_detail|
        drink_hash[:drink_type] = d_detail["strCategory"]
        drink_hash[:glass_type] = d_detail["strGlass"]
        drink_hash[:instructions] = d_detail["strInstructions"]
        Drink.where(drink_hash).first_or_create
    end
end

# scrapes product information

agent_3 = Mechanize.new
product_page = agent_3.get("https://www.thecocktaildb.com/api/json/v2/#{ENV["API_KEY"]}/list.php?i=list")
product_data = JSON.parse(product_page.body)
product_data.first[1].each do |product|
    product_hash = {}   
    product_hash[:name] = product["strIngredient1"]
    agent_4 = Mechanize.new
    product_detail_page = agent_4.get("https://www.thecocktaildb.com/api/json/v2/#{ENV["API_KEY"]}/search.php?i=#{product["strIngredient1"]}")
    product_detail = JSON.parse(product_detail_page.body)
    product_detail.first[1].each do |p_detail|
        # binding.pry
        product_hash[:category] = p_detail["strType"]
        product_hash[:description] = p_detail["strDescription"]
        p_detail["strAlcohol"] != "Yes" ? product_hash[:subcategory] = "Mixer" : product_hash[:subcategory] = ""
        Product.where(product_hash).first_or_create
    end
end

Product.all.each do |product|
    if product.name.present?
        product.name = product.name.titleize
        product.save
    end
end
