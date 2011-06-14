class SteponesController < ApplicationController
  # GET /stepones
  # GET /stepones.xml
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
    @stepone = Stepone.new
    @lastname = cust_info_population.lname
    @firstname = cust_info_population.fname
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepone }
    end
  end

  # GET /stepones/1/edit
  def edit
    @stepone = Stepone.find(params[:id])
  end

  # POST /stepones
  # POST /stepones.xml
  def create
    @stepone = Stepone.new(params[:stepone])

    respond_to do |format|
      if @stepone.save
        format.html { redirect_to(@stepone, :notice => 'Stepone was successfully created.') }
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
        format.html { redirect_to(@stepone, :notice => 'Stepone was successfully updated.') }
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
    @customer = Customer.find(params[:custid])
  end
end