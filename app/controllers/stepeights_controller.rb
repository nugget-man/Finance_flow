class StepeightsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction

  # GET /stepeights
  # GET /stepeights.xml
  def index
    @stepeights = Stepeight.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stepeights }
    end
  end

  # GET /stepeights/1
  # GET /stepeights/1.xml
  def show
    @stepeight = Stepeight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stepeight }
    end
  end

  # GET /stepeights/new
  # GET /stepeights/new.xml
  def new
    @stepeight = Stepeight.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepeight }
    end
  end

  # GET /stepeights/1/edit
  def edit
    @stepeight = Stepeight.find(params[:id])
  end

  # POST /stepeights
  # POST /stepeights.xml
  def create
    @stepeight = Stepeight.new(params[:stepeight])

    respond_to do |format|
      if @stepeight.save
        format.html { redirect_to(root_path, :notice => 'Stepeight was successfully created.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stepeight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stepeights/1
  # PUT /stepeights/1.xml
  def update
    @stepeight = Stepeight.find(params[:id])

    respond_to do |format|
      if @stepeight.update_attributes(params[:stepeight])
        format.html { redirect_to(root_path, :notice => 'Stepeight was successfully updated.') }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stepeight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stepeights/1
  # DELETE /stepeights/1.xml
  def destroy
    @stepeight = Stepeight.find(params[:id])
    @stepeight.destroy

    respond_to do |format|
      format.html { redirect_to(stepeights_url) }
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
