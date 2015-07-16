class MembersController < ApplicationController
  before_filter :find_member, :only => [:subscriptions, :campaign]

  # GET /members
  # GET /members.json
  def index
    @members = Member.limit(10)
    @members = @members.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @members }
    end
  end

  def subscriptions
    @subscriptions = @member.subscriptions
  end

  def campaign
    @subscriptions = @member.subscriptions.where(:campaign_id => params[:campaign_id])

    render 'subscriptions'
  end


  def search    
    @members = Member.where("( lower(members.first_name) || ' ' || lower(members.last_name) ILIKE ? ) OR ( lower(members.last_name) || ' ' || lower(members.first_name) ILIKE ? )",  
                                                    "%#{params[:search_param].downcase}%","%#{params[:search_param].downcase}%")
    @members = @members.page(params[:page]).per(10)
    render :partial => 'list'
  end

  def backordered
    @members = Member.all.select { | x | x.total_available_products > 0 }
    
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @member }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])

    respond_to do |format|
      if @member.save
        format.html { redirect_to members_url , :notice => 'Member was successfully created.' }
        format.json { render :json => @member, :status => :created, :location => @member }
      else
        format.html { render :action => "new" }
        format.json { render :json => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to @member, :notice => 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @member.errors, :status => :unprocessable_entity }
      end
    end
  end


  def delivered_all
    member = Member.find(params[:id])
    member.subscriptions.each do |s|  
      s.available_product_delivereds.each do |pd| 
        product_delivered = ProductDelivered.new
        product_delivered.subscription_id = s.id
        product_delivered.product_received_id = pd.id
        product_delivered.user_id = current_user.id
        product_delivered.delivered_at = Time.now
        product_delivered.save!
      end
    end
    redirect_to members_url , :notice => 'Productos entregados a ' + member.to_label 
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

  private
    def find_member
      if current_user.admin? 
        @member = Member.find params[:member_id]
      elsif current_user.member.id == params[:id].to_i
        @member = Member.find params[:id]
      else
        redirect_to current_user
      end
    end

end
