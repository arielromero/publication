class ProductDeliveredsController < ApplicationController

  before_filter :find_subscription, :only => [:index, :new, :create, :show, :edit, :update]
  # GET /product_delivereds
  # GET /product_delivereds.json
  def index
    @product_delivereds = ProductDelivered.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_delivereds }
    end
  end

  # GET /product_delivereds/1
  # GET /product_delivereds/1.json
  def show
    @product_delivered = ProductDelivered.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_delivered }
    end
  end

  # GET /product_delivereds/new
  # GET /product_delivereds/new.json
  def new
    @product_delivered = ProductDelivered.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_delivered }
    end
  end

  # GET /product_delivereds/1/edit
  def edit
    @product_delivered = ProductDelivered.find(params[:id])
  end

  # POST /product_delivereds
  # POST /product_delivereds.json
  def create
    @product_delivered = ProductDelivered.new(params[:product_delivered])

    respond_to do |format|
      if @product_delivered.save
        format.html { redirect_to @product_delivered, notice: 'Product delivered was successfully created.' }
        format.json { render json: @product_delivered, status: :created, location: @product_delivered }
      else
        format.html { render action: "new" }
        format.json { render json: @product_delivered.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_delivereds/1
  # PUT /product_delivereds/1.json
  def update
    @product_delivered = ProductDelivered.find(params[:id])

    respond_to do |format|
      if @product_delivered.update_attributes(params[:product_delivered])
        format.html { redirect_to @product_delivered, notice: 'Product delivered was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_delivered.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_delivereds/1
  # DELETE /product_delivereds/1.json
  def destroy
    @product_delivered = ProductDelivered.find(params[:id])
    puts "#{@product_delivered.subscription_id}"
    @subscription = Subscription.find @product_delivered.subscription_id
    @product_delivered.destroy

    respond_to do |format|
      format.html { redirect_to campaign_subscription_product_delivereds_path(@subscription.campaign, @subscription)}
      format.json { head :no_content }
    end
  end

  private

  def find_subscription
    @subscription = Subscription.find(params[:subscription_id])
  end
end
