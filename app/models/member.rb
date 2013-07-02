class Member < ActiveRecord::Base
  attr_accessible :address, :email, :first_name, :last_name, :phone
  validates :first_name, :last_name, :presence => true
  
  def to_label
  	first_name + ' ' + last_name
  end
end
