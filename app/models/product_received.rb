class ProductReceived < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :product
  has_many :product_delivereds
  attr_accessible :campaign_id, :description, :product_id, :received_at, :total
end
