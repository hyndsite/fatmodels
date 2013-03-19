class AddNameToMarketPlace < ActiveRecord::Migration
  def change
    add_column :market_places, :name, :string
  end
end
