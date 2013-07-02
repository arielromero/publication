class Product < ActiveRecord::Base
  attr_accessible :name, :numbers
  has_and_belongs_to_many :campaigns
  has_and_belongs_to_many :subscription
  has_many :product_subscriptions  

  validates :name, :numbers, :presence => true
end
