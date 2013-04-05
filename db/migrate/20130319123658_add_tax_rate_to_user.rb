class AddTaxRateToUser < ActiveRecord::Migration
  def change
    add_column :users, :tax_rate, :decimal, precision: 8, scale: 2
  end
end
