class ProductSubscriptionsController < ApplicationController
  # GET /product_subscriptions
  # GET /product_subscriptions.json
  def index
    @product_subscriptions = ProductSubscription.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @product_subscriptions }
    end
  end

  # GET /product_subscriptions/1
  # GET /product_subscriptions/1.json
  def show
    @product_subscription = ProductSubscription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @product_subscription }
    end
  end

  # GET /product_subscriptions/new
  # GET /product_subscriptions/new.json
  def new
    @product_subscription = ProductSubscription.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @product_subscription }
    end
  end

  # GET /product_subscriptions/1/edit
  def edit
    @product_subscription = ProductSubscription.find(params[:id])
  end

  # POST /product_subscriptions
  # POST /product_subscriptions.json
  def create
    @product_subscription = ProductSubscription.new(params[:product_subscription])

    respond_to do |format|
      if @product_subscription.save
        format.html { redirect_to campaign_subscription_path(@product_subscription.subscription.campaign, @product_subscription.subscription), :notice => 'Product subscription was successfully created.' }
        format.json { render :json => @product_subscription, :status => :created, :location => @product_subscription }
      else
        format.html { render :action => "new" }
        format.json { render :json => @product_subscription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_subscriptions/1
  # PUT /product_subscriptions/1.json
  def update
    @product_subscription = ProductSubscription.find(params[:id])

    respond_to do |format|
      if @product_subscription.update_attributes(params[:product_subscription])
        format.html { redirect_to campaign_subscription_path(@product_subscription.subscription.campaign, @product_subscription.subscription), :notice => 'Product subscription was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @product_subscription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_subscriptions/1
  # DELETE /product_subscriptions/1.json
  def destroy
    @product_subscription = ProductSubscription.find(params[:id])
    @product_subscription.destroy

    respond_to do |format|
      format.html { redirect_to campaign_subscription_path(@product_subscription.subscription.campaign, @product_subscription.subscription) , :notice => 'Product subscription was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
