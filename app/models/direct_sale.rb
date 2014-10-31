class DirectSale < ActiveRecord::Base
  attr_accessible :total, :price,  :created_at, :member_id, :product_id
  belongs_to :member
  belongs_to  :product
end