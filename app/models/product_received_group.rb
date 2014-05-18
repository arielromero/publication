class ProductReceivedGroup < ActiveRecord::Base
  belongs_to :campaign
  has_many :product_receiveds
  
  attr_accessible :campaign_id, :description


  def to_label
    description
  end
 
  def delivered?(subscription)
    r = false
    product_receiveds.each do |pr|
      pd = pr.product_delivereds.where(:subscription_id => subscription.id).last
      if pd
        puts "#{pd.subscription.member.to_label}"
        r = true
        break
      else
        r = false
      end
    end
    r
  end


  def to_csv(options = {})
    
    line = Array.new()
    

    CSV.generate(options) do |csv|
      line.push("Entregas: #{campaign.name} - #{description}")
      csv << line
      line.clear
      line.push('Nombre/Producto')
      campaign.products.each do |p|
        line.push(p.name)
      end
      line.push('Entregado')
      csv << line

      campaign.subscriptions.joins(:member).order(:last_name).each.each do |s|
        line.clear
        line.push(s.member.to_label)
        campaign.products.each do |p|
          line.push(s.total_product_subcription(p))
        end  
        delivered?(s) ? line.push('Entregado') : line.push('')  
        csv << line
      end
    end
  end
end