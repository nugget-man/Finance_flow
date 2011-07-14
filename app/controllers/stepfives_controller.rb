class StepfivesController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction

  # GET /stepfives
  # GET /stepfives.xml
  def index
    @stepfives = Stepfive.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stepfives }
    end
  end

  # GET /stepfives/1
  # GET /stepfives/1.xml
  def show
    @stepfive = Stepfive.find_by_customer_id(params[:id])
    @customer = Customer.find(params[:id])
    if Comment.find_by_commentable_id_and_title(params[:id],"Title Ordered")
      @comments = Comment.find_all_by_commentable_id_and_title(params[:id],"Title Ordered")
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stepfive }
    end
  end

  # GET /stepfives/new
  # GET /stepfives/new.xml
  def new
    @stepfive = Stepfive.new
    @customer = Customer.find_by_id(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stepfive }
    end
  end

  # GET /stepfives/1/edit
  def edit
    @stepfive = Stepfive.find_by_customer_id(params[:id])
    @customer = Customer.find_by_id(params[:id])
  end

  # POST /stepfives
  # POST /stepfives.xml
  def create
    @stepfive = Stepfive.new(params[:stepfive])

    respond_to do |format|
      if @stepfive.save
        format.html { redirect_to(root_path, :notice => 'Stepfive was successfully created.') }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stepfive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stepfives/1
  # PUT /stepfives/1.xml
  def update
    @stepfive = Stepfive.find(params[:id])

    respond_to do |format|
      if @stepfive.update_attributes(params[:stepfive])
        format.html { redirect_to(root_path, :notice => 'Stepfive was successfully updated.') }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stepfive.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stepfives/1
  # DELETE /stepfives/1.xml
  def destroy
    @stepfive = Stepfive.find(params[:id])
    @stepfive.destroy

    respond_to do |format|
      format.html { redirect_to(stepfives_url) }
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
