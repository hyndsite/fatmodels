class RemovePointsFromSellerTransaction < ActiveRecord::Migration
    remove_column :seller_transactions, :points
end
