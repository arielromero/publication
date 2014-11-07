class CreateProductReceivedGroups < ActiveRecord::Migration
  def change
    create_table :product_received_groups do |t|
      t.integer :campaign_id
      t.integer :description

      t.timestamps
    end
  end
end
