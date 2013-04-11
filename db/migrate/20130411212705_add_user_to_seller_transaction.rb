class AddUserToSellerTransaction < ActiveRecord::Migration
  def change
    add_column :seller_transactions, :user_id, :integer
  end
end
