class CreateProductReceiveds < ActiveRecord::Migration
  def change
    create_table :product_receiveds do |t|
      t.integer :product_id
      t.integer :total
      t.integer :campaign_id
      t.string :description
      t.timestamps :received_at

      t.timestamps
    end
  end
end
