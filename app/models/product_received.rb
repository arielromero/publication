class ProductReceived < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :product
  belongs_to :product_received_group
  has_many :product_delivereds
  default_scope order('received_at desc')
  attr_accessible :campaign_id, :description, :product_id, :received_at, :total, :product_received_group_id

  def total_delivered
    n = 0
    product_delivereds.each do |pd|
      n = n + pd.subscription.total_product_subcription(pd.product)  
    end
    n
  end
end
