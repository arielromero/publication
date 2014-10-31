class Campaign < ActiveRecord::Base
  attr_accessible :begin_at, :finish_at, :name, :product_ids
  has_and_belongs_to_many  :products
  has_many :subscriptions
  has_many :product_receiveds
  has_many :product_received_groups

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

  def to_csv(options = {})
    line = Array.new()
    line.push(name)
    line.push('Nombre/Producto')
    products.each do |p|
      line.push(p.name)
    end

    CSV.generate(options) do |csv|
      csv << line
      subscriptions.each do |s|
        line.clear
        line.push(s.member.to_label)
        products.each do |p|
          line.push(s.total_product_subcription(p))
        end  
        csv << line
      end
    end
  end

   
end
