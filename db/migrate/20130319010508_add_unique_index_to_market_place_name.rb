class AddUniqueIndexToMarketPlaceName < ActiveRecord::Migration
  def change
    add_index :market_places, :name, unique:true
  end
end
