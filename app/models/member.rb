class Member < ActiveRecord::Base
  has_many :subscriptions
  default_scope order('last_name')
  attr_accessible :address, :email, :first_name, :last_name, :phone
  validates :first_name, :last_name, :presence => true
  
  def to_label
  	last_name + ' ' + first_name
  end
end
