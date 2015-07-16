# run this task with rake db:populate

namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [Campaign, ProductReceivedGroup, DirectSale, Product, ProductReceived, Member, Subscription, ProductSubscription, ProductDelivered].each(&:delete_all)
    
    Campaign.populate 2 do | campaign |
      campaign.begin_at = Faker::Date.between(2.years.ago, 1.years.ago)
      campaign.finish_at = Faker::Date.between(11.months.ago, (Time.now + 6.months))
      campaign.name = campaign.begin_at.year.to_s + " - " + campaign.finish_at.year.to_s
      #campaign.product_ids = [1, 2, 3, 4, 5, 6]

      ProductReceivedGroup.populate 12 do | product_received_group |
        product_received_group.campaign_id = campaign.id
        product_received_group.description = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
      end
    end

    Product.populate 12 do | product |
      product.numbers = 1..12
      product.abbreviation = ""
      product.name = Faker::Commerce.product_name

      ProductReceived.populate 4 do | product_received |
        product_received.campaign_id = 1..2
        product_received.description = ""
        product_received.product_id = product.id
        #product_received.received_at = Time.now # Not created. Whats going on?
        product_received.total = 1..110
        product_received.product_received_group_id 1..12
      end
    end

    Member.populate 100 do | member |
      member.address = Faker::Address.street_address
      member.email = Faker::Internet.email
      member.first_name = Faker::Name.first_name
      member.last_name = Faker::Name.last_name
      member.phone = Faker::PhoneNumber.cell_phone

      Subscription.populate 1..2 do | subscription |
        subscription.member_id = member.id
        subscription.campaign_id = 1..2

        # Subscription to product
        ProductSubscription.populate 1..12 do | product_subscription |
          product_subscription.total = 1..4
          product_subscription.product_id = 1..12
          product_subscription.subscription_id = subscription.id
          product_subscription.begining_date = Time.now
          product_subscription.ending_date = nil

          # Product delivered
          ProductDelivered.populate 1..6 do | product_delivered |
            product_delivered.delivered_at = Time.now
            product_delivered.product_received_id = product_subscription.product_id, 
            product_delivered.subscription_id = subscription.id
            product_delivered.user_id = 1 # User.first.id admin
          end
        end
      end
    end

    DirectSale.populate 10 do | direct_sale | 
      direct_sale.total = 1..10
      direct_sale.price = direct_sale.total * 6
      direct_sale.member_id = 1..10 
      direct_sale.product_id = 1.12
    end
  end
end