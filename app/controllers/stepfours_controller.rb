class StepfoursController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction

  # GET /stepfours
  # GET /stepfours.xml
  def index
    @stepfours = Stepfour.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stepfours }
    end
  end

  # GET /stepfours/1
  # GET /stepfours/1.xml
  def show
    @stepfour = Stepfour.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stepfour }
    end
  end

  # GET /stepfours/new
  # GET /stepfours/new.xml
  def new
    @stepfour = Stepfour.new
    @customer = Customer.find_by_id(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepfour }
    end
  end

  # GET /stepfours/1/edit
  def edit
    @stepfour = Stepfour.find_by_customer_id(params[:id])
    @customer = Customer.find_by_id(params[:id])
  end

  # POST /stepfours
  # POST /stepfours.xml
  def create
    @stepfour = Stepfour.new(params[:stepfour])

    respond_to do |format|
      if @stepfour.save
        format.html { redirect_to(root_path, :notice => 'Stepfour was successfully created.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stepfour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stepfours/1
  # PUT /stepfours/1.xml
  def update
    @stepfour = Stepfour.find(params[:id])

    respond_to do |format|
      if @stepfour.update_attributes(params[:stepfour])
        format.html { redirect_to(root_path, :notice => 'Stepfour was successfully updated.') }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stepfour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stepfours/1
  # DELETE /stepfours/1.xml
  def destroy
    @stepfour = Stepfour.find(params[:id])
    @stepfour.destroy

    respond_to do |format|
      format.html { redirect_to(stepfours_url) }
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
