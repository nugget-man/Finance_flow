class SteponesController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction
  # GET /stepones
  # GET /stepones.xml
  def index
    @stepones = Stepone.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
    #@stepones = Stepone.all
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
    @customer = Customer.find_by_id(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepone }
    end
  end

  # GET /stepones/1/edit
  def edit
    @stepone = Stepone.find_by_customer_id(params[:id])
    @customer = Customer.find_by_id(@stepone.customer_id)
  end

  # POST /stepones
  # POST /stepones.xml
  def create
    @stepone = Stepone.new(params[:stepone])
    respond_to do |format|
      if @stepone.save
        format.html { redirect_to(root_path, :notice => 'Record was successfully created.') }
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
        format.html { redirect_to(root_path, :notice => 'Record was successfully updated.') }
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
  def sort_column
    Customer.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end


  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end



end