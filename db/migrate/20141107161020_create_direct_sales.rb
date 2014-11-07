class CreateDirectSales < ActiveRecord::Migration
  def up
    create_table :direct_sales do |t|
      t.integer :product_id
      t.integer :member_id
      t.float :price
      t.integer :total
    end
  end

  def down
  end
end
