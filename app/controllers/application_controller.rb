class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery

  def after_sign_in_path_for(resource)
  	if current_user.admin?
  		root_path
  	else
  		subscriptions_member_path(current_user.member.id)
  	end
  end
end
