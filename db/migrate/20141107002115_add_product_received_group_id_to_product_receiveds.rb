class AddProductReceivedGroupIdToProductReceiveds < ActiveRecord::Migration
  def change
    add_column :product_receiveds, :product_received_group_id, :integer
  end
end
