class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user
      t.decimal :tax, precision: 8, scale: 2
      t.decimal :total, precision: 8, scale: 2

      t.timestamps
    end
    add_index :orders, :user_id
  end
end
