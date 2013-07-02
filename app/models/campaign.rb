class Campaign < ActiveRecord::Base
  attr_accessible :begin_at, :finish_at, :name, :product_ids
  has_and_belongs_to_many  :products
  has_many :subscriptions

  def to_label
  	name
  end

  def total_subcriptions
  	subscriptions.count
  end

  def subscriptions_for_products(p)
  	t = 0
  	subscriptions.each do |s|
  		s.product_subscriptions.each do |ps|
  		  if ps.product.id == p.id
          t = t + ps.total   
        end 	
  		end
  	end
  	
    t
  end

   
end
