class CreateMarketPlaces < ActiveRecord::Migration
  def change
    create_table :market_places do |t|
      t.references :user
      t.references :product

      t.timestamps
    end
  end
end
