class ProductDelivered < ActiveRecord::Base
  belongs_to :product_received
  belongs_to :subscription
  belongs_to :user
  has_one :product, :through => :product_received
  attr_accessible :delivered_at, :product_received_id, :subscription_id, :user_id
end
