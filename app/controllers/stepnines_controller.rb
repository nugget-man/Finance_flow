class StepninesController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction
  # GET /stepnines
  # GET /stepnines.xml
  def index
    @stepnines = Stepnine.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stepnines }
    end
  end

  # GET /stepnines/1
  # GET /stepnines/1.xml
  def show
    @stepnine = Stepnine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stepnine }
    end
  end

  # GET /stepnines/new
  # GET /stepnines/new.xml
  def new
    @stepnine = Stepnine.new
    @customer = Customer.find_by_id(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepnine }
    end
  end

  # GET /stepnines/1/edit
  def edit
    @stepnine = Stepnine.find_by_customer_id(params[:id])
    @customer = Customer.find_by_id(params[:id])
  end

  # POST /stepnines
  # POST /stepnines.xml
  def create
    @stepnine = Stepnine.new(params[:stepnine])

    respond_to do |format|
      if @stepnine.save
        format.html { redirect_to(root_path, :notice => 'Stepnine was successfully created.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stepnine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stepnines/1
  # PUT /stepnines/1.xml
  def update
    @stepnine = Stepnine.find(params[:id])

    respond_to do |format|
      if @stepnine.update_attributes(params[:stepnine])
        format.html { redirect_to(root_path, :notice => 'Stepnine was successfully updated.') }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stepnine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stepnines/1
  # DELETE /stepnines/1.xml
  def destroy
    @stepnine = Stepnine.find(params[:id])
    @stepnine.destroy

    respond_to do |format|
      format.html { redirect_to(stepnines_url) }
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
