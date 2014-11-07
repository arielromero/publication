class Member < ActiveRecord::Base
  has_many :subscriptions
  default_scope order('last_name')
  attr_accessible :address, :email, :first_name, :last_name, :phone
  validates :first_name, :last_name, :presence => true
  
  def to_label
  	last_name + ', ' + first_name
  end

  def total_available_products
    n = 0
    subscriptions.each do |s|  
      n = n + s.available_product_delivereds.size
    end
    n
  end

  def backordered_products(product_received)
    n = 0
    subscriptions.where(:campaign_id => product_received.campaign_id).each do | s |
      n = n + s.backordered_products(product_received.product_id, product_received.id) 
    end
    n
  end
end
