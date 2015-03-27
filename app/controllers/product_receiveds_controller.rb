class ProductReceivedsController < ApplicationController
 before_filter :find_campaign, :only => [:index, :new, :create, :show, :edit, :update, :destroy]
  # GET /product_receiveds
  # GET /product_receiveds.json
  def index
    
    if params[:group_id] 
      @product_receiveds = ProductReceived.where(:product_received_group_id => params[:group_id], :campaign_id => @campaign.id)
      # hola
    else
      @product_receiveds = ProductReceived.where(:campaign_id => @campaign.id)  
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_receiveds }
    end
  end

  def backordered
    @product_received = ProductReceived.find(params[:id])
    # Buscar suscripciones con ese producto,
    # que todavia no se haya entregado este product received
    # Con eso buscar a los miembros de las suscripciones
    @members = Member.all.select { | x | x.backordered_products(@product_received) > 0 }
  end

  # GET /product_receiveds/1
  # GET /product_receiveds/1.json
  def show
    @product_received = ProductReceived.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_received }
    end
  end

  # GET /product_receiveds/new
  # GET /product_receiveds/new.json
  def new
    @product_received = ProductReceived.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_received }
    end
  end

  # GET /product_receiveds/1/edit
  def edit
    @product_received = ProductReceived.find(params[:id])
  end

  # POST /product_receiveds
  # POST /product_receiveds.json
  def create
    @product_received = ProductReceived.new(params[:product_received])

    respond_to do |format|
      if @product_received.save
        format.html { redirect_to campaign_product_receiveds_path(@campaign), notice: 'Product received was successfully created.' }
        format.json { render json: @product_received, status: :created, location: @product_received }
      else
        format.html { render action: "new" }
        format.json { render json: @product_received.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_receiveds/1
  # PUT /product_receiveds/1.json
  def update
    @product_received = ProductReceived.find(params[:id])
    #puts "#{params.inspect} $$$$$$$$$$"
    respond_to do |format|
      if @product_received.update_attributes(params[:product_received])
        format.html { redirect_to campaign_product_receiveds_path(@campaign), notice: 'Product received was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_received.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_receiveds/1
  # DELETE /product_receiveds/1.json
  def destroy
    @product_received = ProductReceived.find(params[:id])
    @product_received.destroy

    respond_to do |format|
      format.html { redirect_to product_receiveds_url }
      format.json { head :no_content }
    end
  end

  private
  
    def find_campaign
      puts params[:campaign_id]
      @campaign = Campaign.find params[:campaign_id]
    end
end
