class Subscription < ActiveRecord::Base
  attr_accessible :member_id, :campaign_id, :created_at, :product_subscription_ids
  belongs_to :member
  belongs_to :campaign
  #has_and_belongs_to_many  :products
  has_many :product_subscriptions
  has_many :subscribed_products, :through => :product_subscriptions, :source => :product
  attr_accessible :created_at

  def to_label
  	campaign.name
  end

  def available_products
    campaign.products - subscribed_products 	
  end
end
