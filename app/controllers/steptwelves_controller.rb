class SteptwelvesController < ApplicationController
  # GET /steptwelves
  # GET /steptwelves.xml
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_directions
  def index
    @steptwelves = Steptwelve.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @steptwelves }
    end
  end

  # GET /steptwelves/1
  # GET /steptwelves/1.xml
  def show
    @steptwelf = Steptwelve.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @steptwelf }
    end
  end

  # GET /steptwelves/new
  # GET /steptwelves/new.xml
  def new
    @steptwelve = Steptwelve.new
    @customer = Customer.find_by_id(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @steptwelve }

    end
  end

  # GET /steptwelves/1/edit
  def edit
    @steptwelf = Steptwelve.find(params[:id])
    @customer = Customer.find_by_id(params[:id])
  end

  # POST /steptwelves
  # POST /steptwelves.xml
  def create
    @steptwelf = Steptwelve.new(params[:steptwelf])

    respond_to do |format|
      if @steptwelf.save
        format.html { redirect_to(@steptwelf, :notice => 'Steptwelve was successfully created.') }
        format.xml  { render :xml => @steptwelf, :status => :created, :location => @steptwelf }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @steptwelf.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /steptwelves/1
  # PUT /steptwelves/1.xml
  def update
    @steptwelf = Steptwelve.find(params[:id])

    respond_to do |format|
      if @steptwelf.update_attributes(params[:steptwelf])
        format.html { redirect_to(@steptwelf, :notice => 'Steptwelve was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @steptwelf.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /steptwelves/1
  # DELETE /steptwelves/1.xml
  def destroy
    @steptwelf = Steptwelve.find(params[:id])
    @steptwelf.destroy

    respond_to do |format|
      format.html { redirect_to(steptwelves_url) }
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
