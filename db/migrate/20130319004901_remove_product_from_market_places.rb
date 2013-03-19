class RemoveProductFromMarketPlaces < ActiveRecord::Migration
  def up
    remove_column :market_places, :product_id
  end

  def down
    add_column :market_places, :product_id, :integer
  end
end
