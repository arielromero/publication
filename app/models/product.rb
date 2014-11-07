class Product < ActiveRecord::Base
  attr_accessible :name, :numbers, :abbreviation, :by_direct_sale
  has_and_belongs_to_many :campaigns
  has_and_belongs_to_many :subscription
  has_many :product_subscriptions  
  has_many :product_received

  validates :name, :numbers, :abbreviation, :by_direct_sale, :presence => true
end
