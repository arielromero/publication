class SubscriptionsController < ApplicationController
  before_filter :find_campaign, :only => [:index, :new, :create, :show, :edit, :update, :destroy, :delivered, :search]
  # GET /subscriptions
  # GET /subscriptions.json
  def index
    @subscriptions = Subscription.where(:campaign_id => @campaign.id)
    @subscriptions = @subscriptions.joins(:member).order(:last_name)
    @subscriptions = @subscriptions.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @subscriptions }
    end
  end

  def search
    @subscriptions = Subscription.where(:campaign_id => @campaign.id)  
    @subscriptions = @subscriptions.joins(:member)
    @subscriptions = @subscriptions.where("( lower(members.first_name) || ' ' || lower(members.last_name) ILIKE ? ) OR ( lower(members.last_name) || ' ' || lower(members.first_name) ILIKE ? )",  
                                                    "%#{params[:search_param].downcase}%","%#{params[:search_param].downcase}%")
    @subscriptions = @subscriptions.page(params[:page]).per(10)
    render :partial => 'list'
  end
  # GET /subscriptions/1
  # GET /subscriptions/1.json
  def show
    @subscription = Subscription.find(params[:id])
    @product_subscription = ProductSubscription.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @subscription }
    end
  end

  # GET /subscriptions/new
  # GET /subscriptions/new.json
  def new
    @subscription = Subscription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @subscription }
    end
  end

  # GET /subscriptions/1/edit
  def edit
    @subscription = Subscription.find(params[:id])
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(params[:subscription])

    respond_to do |format|
      if @subscription.save
        format.html { redirect_to campaign_subscription_path(@campaign, @subscription), :notice => 'Subscription was successfully created.' }
        format.json { render :json => @subscription, :status => :created, :location => @subscription }
      else
        format.html { render :action => "new" }
        format.json { render :json => @subscription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subscriptions/1
  # PUT /subscriptions/1.json
  def update
    @subscription = Subscription.find(params[:id])

    respond_to do |format|
      if @subscription.update_attributes(params[:subscription])
        format.html { redirect_to campaign_subscriptions_path(@campaign), :notice => 'Subscription was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @subscription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subscriptions/1
  # DELETE /subscriptions/1.json
  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy

    respond_to do |format|
      format.html { redirect_to campaign_subscriptions_path(@campaign) }
      format.json { head :no_content }
    end
  end

  def delivered
    @subscription = Subscription.find params[:id]
    product_delivered = ProductDelivered.new
    product_delivered.subscription_id = @subscription.id
    product_delivered.product_received_id = params[:product_received_id]
    product_delivered.user_id = current_user.id
    product_delivered.delivered_at = Time.now
    product_delivered.save!

    if params[:member_id]
      member = Member.find params[:member_id]
      #redirect_to @member
      redirect_to member, :notice => 'Producto entregado correctamente.'
        
    else
      redirect_to campaign_subscription_product_delivereds_path(@campaign, @subscription), :notice => 'Entregado!!!' 
    end

  end

  private
  
    def find_campaign
      @campaign = Campaign.find params[:campaign_id]
    end

end
