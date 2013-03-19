class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.references :product
      t.integer :qty
      t.decimal :line_total
      t.references :order

      t.timestamps
    end
  end
end
