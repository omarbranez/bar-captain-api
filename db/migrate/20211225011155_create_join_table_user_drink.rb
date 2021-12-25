class CreateJoinTableUserDrink < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :drinks do |t|
      # t.index [:user_id, :drink_id]
      # t.index [:drink_id, :user_id]
    end
  end
end
