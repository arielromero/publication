class DirectSalesController < ApplicationController
  def index
    @directsales = DirectSale.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @directsales }
    end
  end

  # GET /directsales/1
  # GET /directsales/1.json
  def show
    @directsale = DirectSale.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @directsale }
    end
  end

  # GET /directsales/new
  # GET /directsales/new.json
  def new
    @directsale = DirectSale.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @directsale }
    end
  end

  # GET /directsales/1/edit
  def edit
    @directsale = DirectSale.find(params[:id])
  end

  # POST /directsales
  # POST /directsales.json
  def create
    @directsale = DirectSale.new(params[:direct_sale])

    respond_to do |format|
      if @directsale.save
        format.html { redirect_to direct_sales_path(), :notice => 'Sale was successfully created.' }
        format.json { render :json => @directsale, :status => :created, :location => @directsale }
      else
        format.html { render :action => "new" }
        format.json { render :json => @directsale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /directsales/1
  # PUT /directsales/1.json
  def update
    @directsale = DirectSale.find(params[:id])

    respond_to do |format|
      if @directsale.update_attributes(params[:subscription])
        format.html { redirect_to direct_sales_path(), :notice => 'Sale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @directsale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /directsales/1
  # DELETE /directsales/1.json
  def destroy
    @directsale = DirectSale.find(params[:id])
    @directsale.destroy

    respond_to do |format|
      format.html { redirect_to direct_sales_path() }
      format.json { head :no_content }
    end
  end

end