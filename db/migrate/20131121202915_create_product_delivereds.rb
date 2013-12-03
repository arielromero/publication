class CreateProductDelivereds < ActiveRecord::Migration
  def change
    create_table :product_delivereds do |t|
      t.integer :subscription_id
      t.integer :product_received_id
      t.datetime :delivered_at
      t.integer :user_id

      t.timestamps
    end
  end
end
