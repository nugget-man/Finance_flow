class SteponesController < ApplicationController
  # GET /stepones
  # GET /stepones.xml
  before_filter :cust_info_population
  helper_method :cust_info_population
  def index
    @stepones = Stepone.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stepones }
    end
  end

  # GET /stepones/1
  # GET /stepones/1.xml
  def show
    @stepone = Stepone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stepone }
    end
  end

  # GET /stepones/new
  # GET /stepones/new.xml
  def new
    if params[:id]
      @custid = params[:id]
    else
      @custid = session[:custid]
    end
    @stepone = Stepone.new
    @lastname = Customer.find_by_id(@custid).lname
    @firstname = Customer.find_by_id(@custid).fname
    @stepone = Stepone.new(params[:stepone])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepone }
    end
  end

  # GET /stepones/1/edit
  def edit
    @stepone = Stepone.new
    if Stepone.exists?
      @id = @stepone.customer_id
      @customer = Customer.find_by_id(@id)
    end
    @custid = @customer.id
    @lastname = @customer.lname
    @firstname = @customer.fname
  end

  # POST /stepones
  # POST /stepones.xml
  def create

    respond_to do |format|
      if @stepone.save
        format.html { redirect_to(@stepone, :notice => 'Record was successfully created.') }
        format.xml  { render :xml => @stepone, :status => :created, :location => @stepone }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stepone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stepones/1
  # PUT /stepones/1.xml
  def update
    @stepone = Stepone.find(params[:id])

    respond_to do |format|
      if @stepone.update_attributes(params[:stepone])
        format.html { redirect_to(@stepone, :notice => 'Record was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stepone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stepones/1
  # DELETE /stepones/1.xml
  def destroy
    @stepone = Stepone.find(params[:id])
    @stepone.destroy

    respond_to do |format|
      format.html { redirect_to(stepones_url) }
      format.xml  { head :ok }
    end
  end


private
  def cust_info_population
    @customer = Customer.find(params[:id])
  end
end