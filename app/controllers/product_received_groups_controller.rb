class ProductReceivedGroupsController < ApplicationController
   before_filter :find_campaign, :only => [:index, :new, :create, :show, :edit, :update, :destroy]
  # GET /products
  # GET /products.json
  def index
    @product_received_groups = ProductReceivedGroup.where(:campaign_id => @campaign.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @product_received_groups }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product_received_group = ProductReceivedGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @product_received_group }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product_received_group = ProductReceivedGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @product_received_group }
    end
  end

  # GET /products/1/edit
  def edit
    @product_received_group = ProductReceivedGroup.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product_received_group = ProductReceivedGroup.new(params[:product])

    respond_to do |format|
      if @product_received_group.save
        format.html { redirect_to campaign_product_received_groups_path(@campaign), :notice => 'Grupo creado correctamente' }
        format.json { render :json => @product_received_group, :status => :created, :location => @product_received_group }
      else
        format.html { render :action => "new" }
        format.json { render :json => @product_received_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product_received_group = ProductReceivedGroup.find(params[:id])

    respond_to do |format|
      if @product_received_group.update_attributes(params[:product])
        format.html { redirect_to campaign_product_received_groups_path(@campaign), :notice => 'Grupo modificado correctamente' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @product_received_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product_received_group = ProductReceivedGroup.find(params[:id])
    @product_received_group.destroy

    respond_to do |format|
      format.html { redirect_to campaign_product_received_groups_path(@campaign), :notice => 'Grupo eliminado correctamente' }
      format.json { head :no_content }
    end
  end

  def list
    #puts "#{params.inspect}"
    @product_received_group = ProductReceivedGroup.find(params[:id])
    @campaign = @product_received_group.campaign

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @product_received_group }
      format.csv { send_data @product_received_group.to_csv }
      format.xls { send_data @product_received_group.to_csv(col_sep: "\t") }
    end 
  end

  private
  
    def find_campaign
      #puts params[:campaign_id]
      @campaign = Campaign.find params[:campaign_id]
    end
end
