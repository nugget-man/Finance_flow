class StepsixesController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction

  # GET /stepsixes
  # GET /stepsixes.xml
  def index
    @stepsixes = Stepsix.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stepsixes }
    end
  end

  # GET /stepsixes/1
  # GET /stepsixes/1.xml
  def show
    @stepsix = Stepsix.find_by_customer_id(params[:id])
    @customer = Customer.find(params[:id])
    if Comment.find_by_commentable_id_and_title(params[:id],"Bids Ordered/Received")
      @comments = Comment.find_all_by_commentable_id_and_title(params[:id],"Bids Ordered/Received")
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stepsix }
    end
  end

  # GET /stepsixes/new
  # GET /stepsixes/new.xml
  def new
    @stepsix = Stepsix.new
    @customer = Customer.find_by_id(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepsix }
    end
  end

  # GET /stepsixes/1/edit
  def edit
    @stepsix = Stepsix.find_by_customer_id(params[:id])
    @customer = Customer.find_by_id(params[:id])
  end

  # POST /stepsixes
  # POST /stepsixes.xml
  def create
    @stepsix = Stepsix.new(params[:stepsix])

    respond_to do |format|
      if @stepsix.save
        format.html { redirect_to(root_path, :notice => 'Stepsix was successfully created.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stepsix.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stepsixes/1
  # PUT /stepsixes/1.xml
  def update
    @stepsix = Stepsix.find(params[:id])

    respond_to do |format|
      if @stepsix.update_attributes(params[:stepsix])
        format.html { redirect_to(root_path, :notice => 'Stepsix was successfully updated.') }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stepsix.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stepsixes/1
  # DELETE /stepsixes/1.xml
  def destroy
    @stepsix = Stepsix.find(params[:id])
    @stepsix.destroy

    respond_to do |format|
      format.html { redirect_to(stepsixes_url) }
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
