class AddPrimaryKeyConstraintToProductsUsers < ActiveRecord::Migration[7.0]
  # def up
  #   execute "ALTER TABLE products_users ADD PRIMARY KEY (id);"
  # end

  # def down
  #   execute "ALTER TABLE products_users DROP CONSTRAINT products_users_pkey;"
  # end

  def change
    add_column :products_users, :id, :primary_key, first: true 
  end
end
