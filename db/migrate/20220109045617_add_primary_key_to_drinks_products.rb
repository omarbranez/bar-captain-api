class AddPrimaryKeyToDrinksProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :drinks_products, :id
    # execute "ALTER TABLE drinks_products DROP CONSTRAINT drinks_products_id_pkey;"
    add_column :drinks_products, :id, :primary_key
  end
end
