class CreateJoinTableDrinkProduct < ActiveRecord::Migration[7.0]
  def change
    create_join_table :drinks, :products do |t|
      # t.index [:drink_id, :product_id]
      # t.index [:product_id, :drink_id]
      t.string :quantity
    end
  end
end
