class CreateDrinks < ActiveRecord::Migration[7.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :drink_type
      t.string :glass_type
      t.text :instructions
      t.string :photo_url

      t.timestamps
    end
  end
end
