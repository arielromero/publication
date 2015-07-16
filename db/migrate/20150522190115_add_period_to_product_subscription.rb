class AddPeriodToProductSubscription < ActiveRecord::Migration
  def change
    add_column :product_subscriptions, :begining_date, :date
    add_column :product_subscriptions, :ending_date, :date
  end
end
