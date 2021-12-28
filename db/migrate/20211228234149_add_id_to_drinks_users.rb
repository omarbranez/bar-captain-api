class AddIdToDrinksUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :drinks_users, :id, :primary_key
  end
end
