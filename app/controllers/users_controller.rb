class UsersController < ApplicationController
  before_filter :find_user, :only => [:index, :new, :create, :show, :edit, :update, :destroy, :delivered, :search]

	# The user subscriptions
	def index

	end

	


	private
  
    def find_user
    	if current_user.admin? 
    		@user = User.find params[:user_id]
    	elsif current_user.id == params[:id].to_i
    		@user = User.find params[:id]
    	else
    		redirect_to current_user
    	end
    end

end