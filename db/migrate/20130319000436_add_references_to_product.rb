class AddReferencesToProduct < ActiveRecord::Migration
  def change
    add_column :products, :market_place_id, :integer, index: true
  end
end
