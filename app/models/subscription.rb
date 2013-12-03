class Subscription < ActiveRecord::Base
  attr_accessible :member_id, :campaign_id, :created_at, :product_subscription_ids
  belongs_to :member
  belongs_to :campaign
  #has_and_belongs_to_many  :products
  has_many :product_subscriptions
  has_many :subscribed_products, :through => :product_subscriptions, :source => :product
  has_many :product_delivereds
  attr_accessible :created_at

  def to_label
  	campaign.name
  end

  def available_products
    campaign.products - subscribed_products 	
  end

  def available_product_delivereds
    pd = []
    product_delivereds.each do |d|
      pd.push(d.product_received)
    end
    apd = campaign.product_receiveds - pd
    
    delivereds = []

    apd.each do |d|
      if subscribed_products.include? d.product
        delivereds.push(d)
      end
    end
    delivereds

  end

  def total_product_subcription(product)
    total = 0
    product_subscriptions.each do |ps|
      if ps.product.id == product.id then
        total = ps.total
      end
    end
    total
  end
end
