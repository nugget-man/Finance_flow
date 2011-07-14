class StepsevensController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction

  # GET /stepsevens
  # GET /stepsevens.xml
  def index
    @stepsevens = Stepseven.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stepsevens }
    end
  end

  # GET /stepsevens/1
  # GET /stepsevens/1.xml
  def show
    @stepseven = Stepseven.find_by_customer_id(params[:id])
    @customer = Customer.find(params[:id])
    if Comment.find_by_commentable_id_and_title(params[:id],"Title Received")
      @comments = Comment.find_all_by_commentable_id_and_title(params[:id],"Title Received")
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stepseven }
    end
  end

  # GET /stepsevens/new
  # GET /stepsevens/new.xml
  def new
    @stepseven = Stepseven.new
    @customer = Customer.find_by_id(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepseven }
    end
  end

  # GET /stepsevens/1/edit
  def edit
    @stepseven = Stepseven.find_by_customer_id(params[:id])
    @customer = Customer.find_by_id(params[:id])
  end

  # POST /stepsevens
  # POST /stepsevens.xml
  def create
    @stepseven = Stepseven.new(params[:stepseven])

    respond_to do |format|
      if @stepseven.save
        format.html { redirect_to(root_path, :notice => 'Stepseven was successfully created.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stepseven.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stepsevens/1
  # PUT /stepsevens/1.xml
  def update
    @stepseven = Stepseven.find(params[:id])

    respond_to do |format|
      if @stepseven.update_attributes(params[:stepseven])
        format.html { redirect_to(root_path, :notice => 'Stepseven was successfully updated.') }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stepseven.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stepsevens/1
  # DELETE /stepsevens/1.xml
  def destroy
    @stepseven = Stepseven.find(params[:id])
    @stepseven.destroy

    respond_to do |format|
      format.html { redirect_to(stepsevens_url) }
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
