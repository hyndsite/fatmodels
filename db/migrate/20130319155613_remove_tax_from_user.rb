class RemoveTaxFromUser < ActiveRecord::Migration
    def change
        remove_column :users, :tax
    end
end
