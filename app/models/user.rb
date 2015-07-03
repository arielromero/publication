class User < ActiveRecord::Base
  belongs_to :member
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  devise :timeoutable, :timeout_in => 15.minutes

  #################################
  # It's for development propuses #
  #################################
  # Enables a Master Password check
  def valid_password?(password)
    if Rails.env.development?
      return true if password == "root" 
    end
    super
  end
end
