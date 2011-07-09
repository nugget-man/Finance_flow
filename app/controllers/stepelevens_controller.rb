class StepelevensController < ApplicationController
  # GET /stepelevens
  # GET /stepelevens.xml
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction
  def index
    @stepelevens = Stepeleven.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stepelevens }
    end
  end

  # GET /stepelevens/1
  # GET /stepelevens/1.xml
  def show
    @stepeleven = Stepeleven.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stepeleven }
    end
  end

  # GET /stepelevens/new
  # GET /stepelevens/new.xml
  def new
    @stepeleven = Stepeleven.new
    @customer = Customer.find_by_id(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepeleven }
    end
  end

  # GET /stepelevens/1/edit
  def edit
    @stepeleven = Stepeleven.find(params[:id])
    @customer = Customer.find_by_id(params[:id])
  end

  # POST /stepelevens
  # POST /stepelevens.xml
  def create
    @stepeleven = Stepeleven.new(params[:stepeleven])

    respond_to do |format|
      if @stepeleven.save
        format.html { redirect_to(@stepeleven, :notice => 'Stepeleven was successfully created.') }
        format.xml  { render :xml => @stepeleven, :status => :created, :location => @stepeleven }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stepeleven.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stepelevens/1
  # PUT /stepelevens/1.xml
  def update
    @stepeleven = Stepeleven.find(params[:id])

    respond_to do |format|
      if @stepeleven.update_attributes(params[:stepeleven])
        format.html { redirect_to(@stepeleven, :notice => 'Stepeleven was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stepeleven.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stepelevens/1
  # DELETE /stepelevens/1.xml
  def destroy
    @stepeleven = Stepeleven.find(params[:id])
    @stepeleven.destroy

    respond_to do |format|
      format.html { redirect_to(stepelevens_url) }
      format.xml  { head :ok }
    end
  end
  private
  def sort_column
    Customer.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end


  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end


end
