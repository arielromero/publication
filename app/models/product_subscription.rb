class ProductSubscription < ActiveRecord::Base
  
  belongs_to :subscription
  belongs_to :product
  attr_accessible :total, :product_id, :subscription_id
end
