class CreateProductSubscriptions < ActiveRecord::Migration
  def change
    create_table :product_subscriptions do |t|
      t.references :subscription
      t.references :product
      t.integer :total

      t.timestamps
    end
    add_index :product_subscriptions, :subscription_id
    add_index :product_subscriptions, :product_id
  end
end
