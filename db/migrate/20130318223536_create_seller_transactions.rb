class CreateSellerTransactions < ActiveRecord::Migration
  def change
    create_table :seller_transactions do |t|
      t.references :order
      t.decimal :seller_dues, precision: 8, scale: 2
      t.integer :points

      t.timestamps
    end
    add_index :seller_transactions, :order_id
  end
end
